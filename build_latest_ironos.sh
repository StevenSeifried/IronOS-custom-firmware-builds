#!/bin/bash
RELEASE=$(curl -sL https://api.github.com/repos/Ralim/IronOS/releases/latest | jq -r ".tag_name")
git clone --recursive --branch $RELEASE https://github.com/Ralim/IronOS.git
cd IronOS
docker-compose up -d builder
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=Pinecil custom_multi_langs='DE EN' firmware-multi_compressed_Custom"
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=Pinecilv2 custom_multi_langs='DE EN' firmware-multi_compressed_Custom"
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=TS100 custom_multi_langs='DE EN' firmware-multi_compressed_Custom"
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=TS80 custom_multi_langs='DE EN' firmware-multi_compressed_Custom"
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=TS80P custom_multi_langs='DE EN' firmware-multi_compressed_Custom"
docker exec ironos-builder-1 bash -c "cd source/source && make -j8 model=MHP30 custom_multi_langs='DE EN' firmware-multi_compressed_Custom"
docker stop ironos-builder-1
mkdir Output
cd source/Hexfile
cp *multi_compressed_Custom* ../../Output
cd ../../Output
chown -R ${USER}:{$USER} *
chmod 644 *
mv Pinecil_multi_compressed_Custom.dfu IronOS_${RELEASE}_Pinecil_v1-DE_EN.dfu
mv Pinecilv2_multi_compressed_Custom.dfu IronOS_${RELEASE}_Pinecil_v2-DE_EN.dfu
mv MHP30_multi_compressed_Custom.hex IronOS_${RELEASE}_MHP30-DE_EN.hex
mv TS100_multi_compressed_Custom.hex IronOS_${RELEASE}_TS100-DE_EN.hex
mv TS80_multi_compressed_Custom.hex IronOS_${RELEASE}_TS80-DE_EN.hex
mv TS80P_multi_compressed_Custom.hex IronOS_${RELEASE}_TS80P-DE_EN.hex
rm MHP30*
rm Pinecil*
rm TS80*
rm TS100*
sha256sum IronOS_${RELEASE}* >> sha256sums.txt
exit 0;
