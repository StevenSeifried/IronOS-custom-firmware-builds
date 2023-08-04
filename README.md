# IronOS custom firmware builds

Repo to host and archive my own [IronOS](https://github.com/Ralim/IronOS) builds. This repo is primarily for my [Pine64 Pinecil v2](https://wiki.pine64.org/wiki/Pinecil). The firmware builds for the Miniware models are untested by me due to missing hardware.

Firmware languages are German and English.

## build instructions
- Make sure that you have `Docker` and `docker-compose` installed
### automated
#### latest stable
- `sudo bash build_latest_stable.sh`
#### latest dev
- `sudo bash build_latest_dev.sh`
### manual
- `git clone --recursive --branch v2.20 https://github.com/Ralim/IronOS.git`
- `cd IronOS`
- `sh start_dev.sh`
- `cd source/source`
    - For Pinecil v1: `make -j$(nproc) model=Pinecil custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For Pinecil v2: `make -j$(nproc) model=Pinecilv2 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS100: `make -j$(nproc) model=TS100 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS101: `make -j$(nproc) model=TS101 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80: `make -j$(nproc) model=TS80 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80P: `make -j$(nproc) model=TS80P custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For MHP30: `make -j$(nproc) model=MHP30 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For S60: `make -j$(nproc) model=S60 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
- `exit`
## flashing
- Firmware files are in `source/Hexfile`
    - Pinecil v1 needs `.dfu`
    - Pinecil v2 need `.bin`
    - the Miniware's and the Sequre S60 need `.hex`
- For flashing please refer the [IronOS flashing guide for your model](https://ralim.github.io/IronOS/GettingStarted/)

