#!/bin/bash

mkdir -p bin
find . -name ".DS_Store" -exec rm {} \; 
rm -rf ipkg/ 
mkdir -p ipkg/home/retrofw/emus/ons/
mkdir -p ipkg/home/retrofw/apps/gmenu2x/sections/emulators/
cp ons.lnk ipkg/home/retrofw/apps/gmenu2x/sections/emulators/ons.lnk 
cp ons.dge ipkg/home/retrofw/emus/ons/
cp libjpeg.so.9 ipkg/home/retrofw/emus/ons/
cp ../nsaconv ipkg/home/retrofw/emus/ons/
cp ../nsadec ipkg/home/retrofw/emus/ons/
cp ../onscripter ipkg/home/retrofw/emus/ons/
cp ../sarconv ipkg/home/retrofw/emus/ons/
cp ../sardec ipkg/home/retrofw/emus/ons/
cp ons.png ipkg/home/retrofw/emus/ons/

pushd ipkg
cp ../control ./control
cp ../debian-binary ./debian-binary
tar --owner=0 --group=0 -czf control.tar.gz control
tar --owner=0 --group=0 -czf data.tar.gz home
ar rv ons.ipk control.tar.gz data.tar.gz debian-binary

popd

mv ipkg/ons.ipk bin/
rm ipkg/control.tar.gz
rm ipkg/data.tar.gz
#rm ipkg/home/retrofw/apps/ons/ons.dge
#rm -R ipkg/home/retrofw/apps/ons/res
