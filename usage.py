try: 
    import psutil
    import os

    cpu_percent = psutil.cpu_percent(interval=0.5)
    ram_percent = psutil.virtual_memory()[2]
    gb_free = os.statvfs(".")[7]/1000000
    print(f"CPU: {cpu_percent:.1f}% | "
          f"RAM: {ram_percent:.1f}% | "
          f"FS: {gb_free:.1f}gB")

except:
    print("CPU: ? | RAM: ? | FS: ?")
