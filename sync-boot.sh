#!/bin/sh
# for use on Macs to sync EFI partition while already booted in
sudo diskutil mount disk0s1
rsync -ah --delete ./EFI /Volumes/EFI
