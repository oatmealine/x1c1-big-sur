# x1c1-big-sur

OpenCore EFI files, scripts and docs for getting macOS 11 (Big Sur) running on a
Thinkpad X1 Carbon 1st Gen laptop

you're free to use this repo and i'll provide as much support as i can, however
do keep in mind this is my first hackintosh endeavour and i cannot guarantee
stability whatsoever. this might work for X1s past 1st gen with a few
modifications, but i'd recommend starting from scratch rather than reusing the
files here

current status: **WORKS**, see [status](#status)

![](docs/screenshot-20250307.png)

## specs

- model: 3444FHG `dmidecode -s system-product-name`
- bios: G6ETC5WW (2.85 ) `dmidecode -s bios-version`
- cpu: Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz `lshw -class cpu`
- gpu: Intel(R) HD Graphics 4000 `glxinfo | grep 'OpenGL renderer string'`
- ethernet: [Ericsson H5321 gw Mobile Broadband Module](https://www.thinkwiki.org/wiki/Ericsson_H5321_gw_Mobile_Broadband_Module) `lshw -class network`
- wireless: Intel Corporation Centrino Advanced-N 6205 [Taylor Peak] (rev 96) `lspci | grep -i network`
- sound card: Realtek ALC269VC `aplay -l`

i can't guarantee this'll work as well for any other model, but give it a try
anyways; i'm fairly sure the main difference between the x1c1s comes down to
display size and CPU

## scripts

- `sync-usb.sh` is for use while booted into a Linux-like system to sync the
EFI files in the repo to a plugged in flash drive
- `sync-boot.sh` is for already booted macOS systems to sync the EFI files in
the repo to the EFI partition

# status

very few issues remain, though you will inevitably run into jank every once
in a while; see [what doesn't work](#what-doesnt-work)

performance is surprisingly alright despite Ivy Bridge CPUs not being supported
on 11+ officially. haven't noticed any major issues, but there are occasional
lag spikes that are par for the course for a laptop this old

battery usage seems to be Okay, about equivalent to battery usage on linux w/
a performance power profile. i wouldn't really recommend using this on just the
battery alone

## what works

- keyboard, trackpad, The Nipple
  - trackpad has a tiny bit of jank, however, esp with gestures. about what
  you'd expect from emulating mac trackpads from a basic PS/2 one
- sound (speakers, microphone)
- wired internet (usb tethering, ethernet)
- wifi (through [Heliport](https://github.com/OpenIntelWireless/HeliPort/releases/))
- graphics acceleration
- screensaver
- volume controls
- keyboard light control
- sleep mode
- backlight control
- apple id, app store, icloud

## what doesn't work

- secure boot (hasn't affected much so far i think)
- airport features (although Heliport works fine)
- wifi w/ WPA2 Enterprise (requires AirportItlwm i think)
- brightness keys
- bluetooth
- hibernation (maybe??? it's inconsistent..)

## untested

- nvram (testing has been inconclusive, but it SHOULD work..)
- mirroring, external displays, airplay
- airdrop
- VMs
- DRM
- microUSB port
- imessage, facetime, icloud
- handoff. i do not have any apple devices
- iphone/ipad file transfer

# fixes

here's a few of the fixes i had to do to get this to work if you're starting
from scratch / using a similar thinkpad model

## BIOS

unsure if this did anything, but my laptop came with an outdated bios ver 2.72.
you can update it by grabbing an update from [lenovo's website](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-carbon-type-34xx/downloads/driver-list/component?name=BIOS%2FUEFI&id=5AC6A815-321D-440E-8833-B07A93E0428C)
and flashing it onto a USB/CD

## NVRAM

the X1C1 does not have NVRAM, so i emulated it [as shown here](https://dortania.github.io/OpenCore-Post-Install/misc/nvram.html)

if your NVRAM is fucked, you'll likely get stuck on a message like
`apfs_module_load` (this message should not typically result in a visible lag
spike from my experience)

after installing, you'll want to set up LogoutHook from OpenCore's release
archive (`./Launchd.command install`)

## sound

for sound i'm using `AppleALC.kext`. for the `ALC269VC`
codec AppleALC recommends using the following layouts:

```
0x100203, 0x100004, 0x100202, 0x100100, layout 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 37, 38, 39, 40, 44, 45, 47, 55, 58, 66, 69, 76, 77, 88, 89, 91, 93, 99, 100, 111, 127, 128, 138, 188
```

i used layoud ID 6 since it's the first one that works. no clue if there's any
point in picking any other one

## backlight

SSDT_PNLF only started working for me w/ the iGPU register code included

## also see

a few fixes were crossreferenced from faithvoid's [X1C1-Mojave](https://github.com/faithvoid/X1C1-Mojave)
repository, although that one is on Clover and macOS 10.14 (Mojave)

# thank yous

thank you to:

- the [Dortania OpenCore Guide](https://dortania.github.io/), which carried me through this all
- faithvoid's [X1C1-Mojave](https://github.com/faithvoid/X1C1-Mojave) repo
