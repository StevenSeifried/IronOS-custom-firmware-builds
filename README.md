# IronOS custom firmware builds

Repo to host and archive my own [IronOS](https://github.com/Ralim/IronOS) builds. This repo is primarily for my [Pine64 Pinecil v1](https://wiki.pine64.org/wiki/Pinecil). The firmware builds for the Miniware models and the Pinecil v2 are untested by me due to missing hardware.

Firmware languages are German and English.

## build instructions
- Make sure that you have `Docker` and `docker-compose` installed
### automated
- `sudo bash build_latest_ironos.sh`
### manual
- `git clone --recursive --branch v2.20 https://github.com/Ralim/IronOS.git`
- `cd IronOS`
- `sh start_dev.sh`
- `cd source/source`
    - For Pinecil v1: `make -j8 model=Pinecil custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For Pinecil v2: `make -j8 model=Pinecilv2 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS100: `make -j8 model=TS100 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80: `make -j8 model=TS80 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80P: `make -j8 model=TS80P custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For MHP30: `make -j8 model=MHP30 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
- `exit`
## flashing
- Firmware files are in `source/Hexfile`
- Pinecil needs `.dfu`, the Miniware's need `.hex`
- For flashing please refer the [IronOS flashing guide for your model](https://ralim.github.io/IronOS/GettingStarted/)

