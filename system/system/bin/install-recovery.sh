#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:40894464:61379eda051fdab614c68d5694fd5de23e6fe258; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:46d55e3039d49b270b7da38627a46b1a714e4bad \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:40894464:61379eda051fdab614c68d5694fd5de23e6fe258 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
