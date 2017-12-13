# OrangePi0_audio_server

This ia a simple, automatic audio server build on an Orange Pi 0 board.
It streams the sound from the microphone located on a Orange Pi 0 
extension board.

After unpacking, you only need to run the "buduj.sh" script.
Then you should copy the generated sdcard.img to the SD card.

(If you recompile the system, you may copy the new image to the
SD card without removing it from the OPi (assuming that the OPi gets
via DHCP the address 1.2.3.4) :

    On OPi:
    # mkdir /tmp/p
    # mount /dev/mmcblk0p1 /tmp/p
    
    On the host:
    $scp zImage root@1.2.3.4:/tmp/p
    $scp sun8i-h2-plus-orangepi-zero.dtb root@1.2.3.4:/tmp/p
    $scp boot.scr root@1.2.3.4:/tmp/p
    
    Again on OPi
    # sync
    # reboot
)

The system works from initramfs, so it may be switched off any time 
without risking the filesystem corruption.
(I had to modify the kernel load address in the boot.scr to avoid
overwriting the kernel with DT during boot).

I haven't check howeve if the logs do not fill the ramdisk, causing system to freeze
after the long operation.
I'm sorry but this is just a quick&dirty "proof of the concept" implementation.

When the system starts, it gets it IP via DHCP (again I assume that it is 1.2.3.4)
and starts the server. You may receive the sound e.g., via:

    $ mplayer http://ip.orange.pi:8090/test1.mp3 -nocache

The root password on OPi is set to "test32". You may change it in the BR
configuration
Feel free to do any modification to that design.

PLEASE NOTE, I DO NOT GIVE YOU ANY WARRANTY! IT HAPPENED TO WORK FOR ME, BUT 
I DO NOT WARRANT THAT IT WILL WORK FOR YOU.
