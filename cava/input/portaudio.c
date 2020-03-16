#include "input/portaudio.h"
#include "input/common.h"

#include <portaudio.h>
#define PORTBUFSIZE 512

#define SAMPLE_SILENCE 32768
#define PA_SAMPLE_TYPE paInt16
typedef short SAMPLE;

typedef struct {
    int frameIndex; /* Index into sample array. */
    int maxFrameIndex;
    SAMPLE *recordedSamples;
} paTestData;

static struct audio_data *audio;
// static int n = 0;

static int recordCallback(const void *inputBuffer, void *outputBuffer,
                          unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *timeInfo,
                          PaStreamCallbackFlags statusFlags, void *userData) {
    paTestData *data = (paTestData *)userData;
    SAMPLE *rptr = (SAMPLE *)inputBuffer;
    long framesToCalc;
    // long i;
    int finished;
    unsigned long framesLeft = data->maxFrameIndex - data->frameIndex;
    int16_t silence_buffer[PORTBUFSIZE] = {SAMPLE_SILENCE};
    (void)outputBuffer; // Prevent unused variable warnings.
    (void)timeInfo;
    (void)statusFlags;
    (void)userData;

    if (framesLeft < framesPerBuffer) {
        framesToCalc = framesLeft;
        finished = paComplete;
    } else {
        framesToCalc = framesPerBuffer;
        finished = paContinue;
    }

    if (inputBuffer == NULL) {
        write_to_fftw_input_buffers(silence_buffer, framesToCalc, audio);
        /*
                        for(i=0; i<framesToCalc; i++) {
                                if(audio->channels == 1) audio->audio_out_l[n] = SAMPLE_SILENCE;
                                if(audio->channels == 2) {
                                        audio->audio_out_l[n] = SAMPLE_SILENCE;
                                        audio->audio_out_r[n] = SAMPLE_SILENCE;
                                }
                                if(n == PORTBUFSIZE-1) n = 0;
                        }
        */
    } else {
        write_to_fftw_input_buffers(rptr, framesToCalc, audio);
        /*
                        for(i=0; i<framesToCalc; i++) {
                                if(audio->channels == 1) {
                                        audio->audio_out_l[n] = (rptr[0] + rptr[1]) / 2;
                                        rptr += 2;
                                }
                                if(audio->channels == 2) {
                                        audio->audio_out_l[n] = *rptr++;
                                        audio->audio_out_r[n] = *rptr++;
                                }
                                n++;
                                if(n == PORTBUFSIZE-1) n = 0;
                        }
        */
    }

    data->frameIndex += framesToCalc;
    if (finished == paComplete) {
        data->frameIndex = 0;
        finished = paContinue;
    }
    return finished;
}

void portaudio_simple_free(paTestData data) {
    Pa_Terminate();
    free(data.recordedSamples);
}

void *input_portaudio(void *audiodata) {
    audio = (struct audio_data *)audiodata;

    PaStreamParameters inputParameters;
    PaStream *stream;
    PaError err = paNoError;
    paTestData data;

    // start portaudio
    err = Pa_Initialize();
    if (err != paNoError) {
        fprintf(stderr, "Error: unable to initilize portaudio - %s\n", Pa_GetErrorText(err));
        exit(EXIT_FAILURE);
    }

    // get portaudio device
    int deviceNum = -1, numOfDevices = Pa_GetDeviceCount();
    if (!strcmp(audio->source, "list")) {
        if (numOfDevices < 0) {
            fprintf(stderr, "Error: portaudio was unable to find a audio device! Code: 0x%x\n",
                    numOfDevices);
            exit(EXIT_FAILURE);
        }
        for (int i = 0; i < numOfDevices; i++) {
            const PaDeviceInfo *deviceInfo = Pa_GetDeviceInfo(i);
            printf("Device #%d: %s\n"
                   "\tInput Channels: %d\n"
                   "\tOutput Channels: %d\n"
                   "\tDefault SampleRate: %lf\n",
                   i + 1, deviceInfo->name, deviceInfo->maxInputChannels,
                   deviceInfo->maxOutputChannels, deviceInfo->defaultSampleRate);
        }
        exit(EXIT_SUCCESS);
    } else if (!strcmp(audio->source, "auto")) {
        deviceNum = Pa_GetDefaultInputDevice();

        if (deviceNum == paNoDevice) {
            fprintf(stderr, "Error: no portaudio input device found\n");
            exit(EXIT_FAILURE);
        }
    } else if (sscanf(audio->source, "%d", &deviceNum)) {
        if (deviceNum > numOfDevices) {
            fprintf(stderr, "Error: Invalid input device!\n");
            exit(EXIT_FAILURE);
        }
        deviceNum--;
    } else {
        for (int i = 0; i < numOfDevices; i++) {
            const PaDeviceInfo *deviceInfo = Pa_GetDeviceInfo(i);
            if (!strcmp(audio->source, deviceInfo->name)) {
                deviceNum = i;
                break;
            }
        }
        if (deviceNum == -1) {
            fprintf(stderr, "Error: No such device '%s'!\n", audio->source);
            exit(EXIT_FAILURE);
        }
    }
    inputParameters.device = deviceNum;

    // set parameters
    data.maxFrameIndex = PORTBUFSIZE;
    data.recordedSamples = (SAMPLE *)malloc(2 * PORTBUFSIZE * sizeof(SAMPLE));
    if (data.recordedSamples == NULL) {
        fprintf(stderr, "Error: failure in memory allocation!\n");
        exit(EXIT_FAILURE);
    } else
        memset(data.recordedSamples, 0x00, 2 * PORTBUFSIZE);

    inputParameters.channelCount = 2;
    inputParameters.sampleFormat = PA_SAMPLE_TYPE;
    inputParameters.suggestedLatency =
        Pa_GetDeviceInfo(inputParameters.device)->defaultLowInputLatency;
    inputParameters.hostApiSpecificStreamInfo = NULL;

    // set it to work
    err = Pa_OpenStream(&stream, &inputParameters, NULL, audio->rate, PORTBUFSIZE, paClipOff,
                        recordCallback, &data);
    if (err != paNoError) {
        fprintf(stderr, "Error: failure in opening stream (%x)\n", err);
        exit(EXIT_FAILURE);
    }

    // main loop
    while (1) {
        // start recording
        data.frameIndex = 0;
        err = Pa_StartStream(stream);
        if (err != paNoError) {
            fprintf(stderr, "Error: failure in starting stream (%x)\n", err);
            exit(EXIT_FAILURE);
        }

        //  record
        while ((err = Pa_IsStreamActive(stream)) == 1) {
            Pa_Sleep(5);
            if (audio->terminate == 1)
                break;
        }
        // check for errors
        if (err < 0) {
            fprintf(stderr, "Error: failure in recording audio (%x)\n", err);
            exit(EXIT_FAILURE);
        }

        // check if it bailed
        if (audio->terminate == 1)
            break;
    }
    // close stream
    if ((err = Pa_CloseStream(stream)) != paNoError) {
        fprintf(stderr, "Error: failure in closing stream (%x)\n", err);
        exit(EXIT_FAILURE);
    }

    portaudio_simple_free(data);
    return 0;
}
