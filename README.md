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
- `exit`
- Firmware files are in `source/Hexfile`


## SHA sums:
- `IronOS_v2.19_Pinecil_v1-DE_EN.bin`
    - SHA256: `4b0788d4da07e025fc91d59fb1116480b6558adf88a89fb92ded456af8443737`
    - SHA512: `fc2a337ab7e8be80f7b013ff7bedfb8774beb16d9f20a7af4db5808f83766e1ed9bc0670e44c3b89164f11fee183960581f434842a70b6fa49264db7c5b8a230`
- `IronOS_v2.19_TS80-DE_EN.hex`
    - ShA256: `c4710fa0e98ee1292cb46ff3c7908848ef15fedea720feae8933cd45a8221c1b`
    - SHA512: `d217f7bb4f9c19ec5b558fb7ef40a2626423cb2ab98d9b440a481603e2a15fb4db29f30fa370b919484a19017c84b2ceaf4a747adf56fd23adb6213e14d66fc6`
- `IronOS_v2.19_TS80P-DE_EN.hex`
    - ShA256: `ff04cc6e3fe5d8ae35f139a7cb03d04da9bb374511a6b998f9e5be244a825ad4`
    - SHA512: `fcaa5e80619a817958b2008a685d86dfda1e5f0e31c2ff3a10151d599a97b0806a2e9a07780cce2323dd6b6ff058ecb25cc78b8e5e28b7c64d1eea2619a92c90`
- `IronOS_v2.19_TS100-DE_EN.hex`
    - ShA256: `ff2b75d3e86a475c956b2f02c4cee92127ab13d45182ad340047f058473adb81`
    - SHA512: `751693d5e5d87551cdd629499c01bd2ced2154e38d99d4ca6bbe922ab03722e3825a6869f99dc3e810572428126ab6e0f86288c0f9ddde4bae29f91bbd050463`
- `IronOS_v2.19_MHP30-DE_EN.hex`
    - ShA256: `c92c3847fdabc9706b6881e3751073bbce218ff12fb067e4df458be14571b6d1`
    - SHA512: `751693d5e5d87551cdd629499c01bd2ced2154e38d99d4ca6bbe922ab03722e3825a6869f99dc3e810572428126ab6e0f86288c0f9ddde4bae29f91bbd050463`