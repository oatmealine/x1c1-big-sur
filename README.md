# x1c1-big-sur

OpenCore EFI files for getting macOS 11 (Big Sur) running on a Thinkpad X1 Carbon 1st Gen laptop

current status: **BROKEN**, stuck on [PCI allocation issues](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/kernel-issues.html#stuck-on-rtc-pci-configuration-begins-previous-shutdown-hpet-hid-legacy)

i'll prolly put more docs here if/when i get it to work

## specs

- model: 3444FHG `dmidecode -s system-product-name`
- bios: G6ETC5WW (2.85 ) `dmidecode -s bios-version`
- cpu: Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz `lshw -class cpu`
- gpu: Intel(R) HD Graphics 4000 `glxinfo | grep 'OpenGL renderer string'`
- ethernet: [Ericsson H5321 gw Mobile Broadband Module](https://www.thinkwiki.org/wiki/Ericsson_H5321_gw_Mobile_Broadband_Module) `lshw -class network`
- wireless: Intel Corporation Centrino Advanced-N 6205 [Taylor Peak] (rev 96) `lspci | grep -i network`
- sound card: Realtek ALC269VC

## also see

a few fixes were crossreferenced from faithvoid's [X1C1-Mojave](https://github.com/faithvoid/X1C1-Mojave) repository,
although that one is on Clover and macOS 10.14 (Mojave). additionally, it's a different X1C1 model
