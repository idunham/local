#!/bin/bash
#cd /mnt/mesa/gfx/mesa.git/
#git branch
#echo "$@"| grep -Ewo branch=[[:alnum:][:punct:]]*|sed

doconfig(){
# $1 should be prefix!
	make clean
	./autogen.sh --enable-gallium-llvm --with-gallium-drivers=r600 --enable-glx --enable-motif --enable-glw --enable-texture-float --disable-gles1 --enable-shared-glapi --enable-gles2 --enable-egl --enable-xvmc --prefix=$1 --without-dri-drivers --with-dri-driverdir=$1/lib --enable-shared-glapi
}

dotest(){
	glxgears
}

git checkout master
git pull
export PFX=/opt/gl-master

doconfig ${PFX}
make >master.err 2>&1 && sudo make install
LD_LIBRARY_PATH=${PFX}/lib LIBGL_DRIVERS_PATH=${PFX}/lib glxgears

git checkout rs780
git pull git://anongit.freedesktop.org/mesa/mesa master
export PFX=/opt/rs780

doconfig ${PFX}
make >rs780.err 2>&1 && sudo make install
LD_LIBRARY_PATH=${PFX}/lib LIBGL_DRIVERS_PATH=${PFX}/lib glxgears



