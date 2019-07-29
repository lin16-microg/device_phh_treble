#!/system/bin/sh
set -e

# Beauty mode breaks on hi3650. Nuking this lib, though, doesn't seem to break anything, and
# it makes the front camera work.
mount --bind /system/etc/empty /odm/lib64/libFNVfbEngineLib.so
