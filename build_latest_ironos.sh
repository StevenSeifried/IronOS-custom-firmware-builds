#!/bin/bash
LC_ALL=C
LANG=C
LANGUAGE=C
RELEASE=$(curl -sL https://api.github.com/repos/Ralim/IronOS/releases/latest | jq -r ".tag_name")
git clone -c advice.detachedHead=false --recursive --branch $RELEASE https://github.com/Ralim/IronOS.git
cd IronOS
docker-compose up -d builder
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=Pinecil custom_multi_langs='DE EN' firmware-multi_compressed_Custom" > /dev/null 2>&1
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=Pinecilv2 custom_multi_langs='DE EN' firmware-multi_compressed_Custom" > /dev/null 2>&1
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=TS100 custom_multi_langs='DE EN' firmware-multi_compressed_Custom" > /dev/null 2>&1
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=TS80 custom_multi_langs='DE EN' firmware-multi_compressed_Custom" > /dev/null 2>&1
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=TS80P custom_multi_langs='DE EN' firmware-multi_compressed_Custom" > /dev/null 2>&1
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=MHP30 custom_multi_langs='DE EN' firmware-multi_compressed_Custom" > /dev/null 2>&1
docker stop ironos-builder-1
mkdir Output
cd source/Hexfile
cp *multi_compressed_Custom* ../../Output
cd ../../Output
chown -R 1000:1000 *
chmod 644 *
mv Pinecil_multi_compressed_Custom.dfu ../../Pinecil_v1/IronOS_${RELEASE}_Pinecil_v1-DE_EN.dfu
mv Pinecilv2_multi_compressed_Custom.dfu ../../Pinecil_v2/IronOS_${RELEASE}_Pinecil_v2-DE_EN.dfu
mv MHP30_multi_compressed_Custom.hex ../../MHP30/IronOS_${RELEASE}_MHP30-DE_EN.hex
mv TS100_multi_compressed_Custom.hex ../../TS100/IronOS_${RELEASE}_TS100-DE_EN.hex
mv TS80_multi_compressed_Custom.hex ../../TS80/IronOS_${RELEASE}_TS80-DE_EN.hex
mv TS80P_multi_compressed_Custom.hex ../../TS80P/IronOS_${RELEASE}_TS80P-DE_EN.hex
cd ../../
sha256sum Pinecil_v1/IronOS_${RELEASE}_Pinecil_v1-DE_EN.dfu >> Pinecil_v1/sha256sums.txt
sha256sum Pinecil_v2/IronOS_${RELEASE}_Pinecil_v2-DE_EN.dfu >> Pinecil_v2/sha256sums.txt
sha256sum MHP30/IronOS_${RELEASE}_MHP30-DE_EN.hex >> MHP30/sha256sums.txt
sha256sum TS80/IronOS_${RELEASE}_TS80-DE_EN.hex >> TS80/sha256sums.txt
sha256sum TS80P/IronOS_${RELEASE}_TS80P-DE_EN.hex >> TS80/sha256sums.txt
sha256sum TS100/IronOS_${RELEASE}_TS100-DE_EN.hex >> TS100/sha256sums.txt
chown -R 1000:1000 */sha256sums.txt
rm -R IronOS
unset LC_ALL
unset LANG
unset LANGUAGE
exit 0;