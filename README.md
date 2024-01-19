# IronOS custom firmware builds

Repo to host and archive my own [IronOS](https://github.com/Ralim/IronOS) builds. This repo is primarily for my [Pine64 Pinecil v2](https://wiki.pine64.org/wiki/Pinecil) and Miniware TS101. \
The firmware builds for the other models are untested by me due to missing hardware.

Firmware languages are German and English.

## build instructions
- Make sure that you have `Docker` and `docker-compose` installed
- `RELEASE=$(curl -sL https://api.github.com/repos/Ralim/IronOS/releases/latest | jq -r ".tag_name")`
- `git clone -c advice.detachedHead=false --recursive --branch $RELEASE https://github.com/Ralim/IronOS.git`
- `cd IronOS/scripts`
- `sudo sh deploy.sh`
- `cd source`
    - For MHP30: `make -j$(nproc) model=MHP30 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For Pinecil v1: `make -j$(nproc) model=Pinecil custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For Pinecil v2: `make -j$(nproc) model=Pinecilv2 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For S60: `make -j$(nproc) model=S60 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80: `make -j$(nproc) model=TS80 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80P: `make -j$(nproc) model=TS80P custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS100: `make -j$(nproc) model=TS100 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS101: `make -j$(nproc) model=TS101 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
- `exit`
## rename files
- `cd ../source/Hexfile`
- For MHP30: `mv MHP30_multi_compressed_Custom.hex IronOS_${RELEASE}_MHP30-DE_EN.hex`
- For Pinecil v1: `mv Pinecil_multi_compressed_Custom.dfu IronOS_${RELEASE}_Pinecil_v1-DE_EN.dfu`
- For Pinecil v2: `mv Pinecilv2_multi_compressed_Custom.bin IronOS_${RELEASE}_Pinecil_v2-DE_EN.bin`
- For S60: `mv S60_multi_compressed_Custom.hex IronOS_${RELEASE}_S60-DE_EN.hex`
- For TS80: `mv TS80_multi_compressed_Custom.hex IronOS_${RELEASE}_TS80-DE_EN.hex`
- For TS80P: `mv TS80P_multi_compressed_Custom.hex IronOS_${RELEASE}_TS80P-DE_EN.hex`
- For TS100: `mv TS100_multi_compressed_Custom.hex IronOS_${RELEASE}_TS100-DE_EN.hex`
- For TS101: `mv TS101_multi_compressed_Custom.hex IronOS_${RELEASE}_TS101-DE_EN.hex`
## flashing
- Firmware files are in `source/Hexfile`
    - Pinecil v1 needs `.dfu`
    - Pinecil v2 need `.bin`
    - the Miniware's and the Sequre S60 need `.hex`
- For flashing please refer the [IronOS flashing guide for your model](https://ralim.github.io/IronOS/GettingStarted/)
