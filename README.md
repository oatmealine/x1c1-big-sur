# x1c1-big-sur

OpenCore EFI files for getting macOS 11 (Big Sur) running on a Thinkpad X1 Carbon 1st Gen laptop

current status: **WORKS**, see [status](#status)

i'll prolly put more docs here later

## specs

- model: 3444FHG `dmidecode -s system-product-name`
- bios: G6ETC5WW (2.85 ) `dmidecode -s bios-version`
- cpu: Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz `lshw -class cpu`
- gpu: Intel(R) HD Graphics 4000 `glxinfo | grep 'OpenGL renderer string'`
- ethernet: [Ericsson H5321 gw Mobile Broadband Module](https://www.thinkwiki.org/wiki/Ericsson_H5321_gw_Mobile_Broadband_Module) `lshw -class network`
- wireless: Intel Corporation Centrino Advanced-N 6205 [Taylor Peak] (rev 96) `lspci | grep -i network`
- sound card: Realtek ALC269VC

# status

## works

- sound
- wifi (through [Heliport](https://github.com/OpenIntelWireless/HeliPort/releases/))
- graphics acceleration

## doesn't work

- secure boot (hasn't affected much so far i think)

## untested

- imessage, facetime, icloud, etc. i do not have an Apple ID

# fixes

here's a few of the fixes i had to do to get this to work

## BIOS

unsure if this did anything, but my laptop came with bios ver 2.72. you can update it by grabbing an update from
[lenovo's website](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-carbon-type-34xx/downloads/driver-list/component?name=BIOS%2FUEFI&id=5AC6A815-321D-440E-8833-B07A93E0428C) and flashing it onto a USB/CD

## NVRAM

the X1C1 does not seem to have NVRAM, so i emulated it [as shown here](https://dortania.github.io/OpenCore-Post-Install/misc/nvram.html)

if your NVRAM is fucked, you'll likely get stuck on a message like `apfs_module_load` (this message should not
typically result in a visible lag spike from my experience)

## also see

a few fixes were crossreferenced from faithvoid's [X1C1-Mojave](https://github.com/faithvoid/X1C1-Mojave) repository,
although that one is on Clover and macOS 10.14 (Mojave). additionally, it's a different X1C1 model
