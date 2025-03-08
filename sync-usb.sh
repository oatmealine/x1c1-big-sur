#!/bin/sh
# for use on Linux-esque systems to sync EFI folder to a plugged in flash drive
udisksctl mount -b /dev/sdb1
rsync -ah --delete --info=progress2 ./EFI /run/media/$USER/OPENCORE/
