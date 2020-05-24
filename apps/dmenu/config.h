/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1; /* -c option for centering */
static int min_width = 500; /* minimum centered width */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Hack:size=14"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
            /*     fg         bg       */
  [SchemeNorm] = { "#81a1c1", "#2e3440" },
  [SchemeSel] =  { "#88c0d0", "#4c566a" },
  [SchemeOut] =  { "#d8dee9", "#81a1c1" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 10;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

// border width
static const unsigned int border_width = 4;

