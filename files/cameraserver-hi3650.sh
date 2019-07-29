#!/system/bin/sh
set -e

exec runcon u:r:su:s0 /system/bin/cameraserver

