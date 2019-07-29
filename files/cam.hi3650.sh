#!/system/bin/sh
set -e

stop CameraDaemon
stop cameraserver

CAM_ARGS=`cat /odm/etc/init/init.hisi.odm.rc | grep CameraDaemon | cut -f4- -d' '`
PLAT=`echo $CAM_ARGS | cut -f1 -d' ' | sed -e 's/\r//g'`
MDL=`echo $CAM_ARGS | cut -f2 -d' ' | sed -e 's/\r//g'`

# Beauty mode breaks on hi3650. Nuking this lib, though, doesn't seem to break anything, and
# it makes the front camera work.
mount --bind /system/etc/empty /odm/lib64/libFNVfbEngineLib.so

nohup runcon u:r:su:s0 /vendor/bin/CameraDaemon $PLAT $MDL >/dev/null 2>&1 </dev/null &
nohup runcon u:r:su:s0 /system/bin/cameraserver >/dev/null 2>&1 </dev/null &
