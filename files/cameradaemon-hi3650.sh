#!/system/bin/sh
set -e

stop CameraDaemon

CAM_ARGS=`cat /odm/etc/init/init.hisi.odm.rc | grep CameraDaemon | cut -f4- -d' '`
PLAT=`echo $CAM_ARGS | cut -f1 -d' ' | sed -e 's/\r//g'`
MDL=`echo $CAM_ARGS | cut -f2 -d' ' | sed -e 's/\r//g'`

exec runcon u:r:su:s0 /vendor/bin/CameraDaemon $PLAT $MDL

