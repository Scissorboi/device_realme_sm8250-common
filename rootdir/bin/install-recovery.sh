#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:401f5300dd8a2dda385200deadbbb50ab61fe887; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:e216da62df812db972739a1f8125091a8fdcc201 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:401f5300dd8a2dda385200deadbbb50ab61fe887 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
