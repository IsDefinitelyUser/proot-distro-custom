#!/bin/sh

echo && echo "Is proot-distro installed?" && echo
apt install --assume-yes --show-progress proot-distro

echo && echo "Copying scripts from 'custom-install' directory to proot-distro:" && echo
cp --verbose $PWD/custom-install/*.sh $PREFIX/etc/proot-distro/
