#!/bin/sh

echo "Adding scripts from ./custom-install/ to $PREFIX/etc/proot-distro/"
cp $PWD/custom-install/*.sh $PREFIX/etc/proot-distro/
