Configuration and things related to the Retroflag GPi case
==========================================================

Overview
--------

Retroflag provides 2 device tree binary overlay files and a config.txt. They
are necessary for getting the video and audio to work in the GPi case.

I looked into the provided dtbo files and managed to recreate source files for
them.

Installation
-------------

- Run `compile-dts.sh` to get the `.dtbo` files
- Place the `.dtbo` files in `/boot/overlays/`
- Place the `config.txt` file in `/boot/` after backing up the stock config.txt

Uninstallation
--------------

- Restore the stock `config.txt` from backup
