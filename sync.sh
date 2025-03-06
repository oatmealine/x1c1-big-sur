#!/bin/sh
udisksctl mount -b /dev/sdb1
rsync -ah --delete --info=progress2 ./EFI /run/media/oatmealine/OPENCORE/
