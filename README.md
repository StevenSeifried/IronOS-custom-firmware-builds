# IronOS custom firmware builds

Repo to host and archive my own [IronOS](https://github.com/Ralim/IronOS) builds. This repo is primarily for my [Pine64 Pinecil v1](https://wiki.pine64.org/wiki/Pinecil). The firmware builds for the Miniware models are untested by me due to missing hardware.

Firmware languages are German and English.

## build instructions
- Make sure that you have `Docker` and `docker-compose` installed
- `git clone --recursive --branch v2.19 https://github.com/Ralim/IronOS.git`
- `cd IronOS`
- `sh start_dev.sh`
- `cd source/source`
    - For Pinecil v1: `make -j8 model=Pinecil custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS100: `make -j8 model=TS100 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80: `make -j8 model=TS80 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For TS80P: `make -j8 model=TS80P custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
    - For MHP30: `make -j8 model=MHP30 custom_multi_langs="DE EN" firmware-multi_compressed_Custom`
- `exit`
- Firmware files are in `source/Hexfile`
- Pinecil needs `.dfu`, the Miniware's need `.hex`
- For flashing please refer the [IronOS flashing guide for your model](https://ralim.github.io/IronOS/GettingStarted/)

## sha256sums:
- `IronOS_v2.19_Pinecil_v1-DE_EN.bin`
    - SHA256: `4b0788d4da07e025fc91d59fb1116480b6558adf88a89fb92ded456af8443737`
- `IronOS_v2.19_TS80-DE_EN.hex`
    - SHA256: `c4710fa0e98ee1292cb46ff3c7908848ef15fedea720feae8933cd45a8221c1b`
- `IronOS_v2.19_TS80P-DE_EN.hex`
    - SHA256: `ff04cc6e3fe5d8ae35f139a7cb03d04da9bb374511a6b998f9e5be244a825ad4`
- `IronOS_v2.19_TS100-DE_EN.hex`
    - SHA256: `ff2b75d3e86a475c956b2f02c4cee92127ab13d45182ad340047f058473adb81`
- `IronOS_v2.19_MHP30-DE_EN.hex`
    - SHA256: `c92c3847fdabc9706b6881e3751073bbce218ff12fb067e4df458be14571b6d1`