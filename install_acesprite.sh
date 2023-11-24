#!/usr/bin/bash
set -e

export CC=clang
export CXX=clang++

# Download dependencies
sudo apt install -y g++ clang libc++-dev libc++abi-dev cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev python3 python-is-python3

# Remove skia and aseprite directories.
rm -rf skia
rm -rf depot_tools
rm -rf aseprite

# Build Skia
git clone --depth 1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
git clone --depth 1 --branch aseprite-m102 https://github.com/aseprite/skia.git
export PATH="${PWD}/depot_tools:${PATH}"
cd skia
python3 tools/git-sync-deps
gn gen out/Release-x64 --args='is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false cc="clang" cxx="clang++" extra_cflags_cc=["-stdlib=libc++"] extra_ldflags=["-stdlib=libc++"]'
ninja -C out/Release-x64 skia modules
cd ..

# Install acesprite.
git clone --depth 1 --branch v1.2.40 https://github.com/aseprite/aseprite.git
cd aseprite
git submodule update --init --recursive
mkdir build
cd build
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ \
  -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=../../skia \
  -DSKIA_LIBRARY_DIR=../../skia/out/Release-x64 \
  -DSKIA_LIBRARY=../../skia/out/Release-x64/libskia.a \
  -G Ninja \
  ..
ninja aseprite
sudo mkdir /opt/aseprite
sudo cp -rv ./bin/* /opt/aseprite
sudo cp -s /opt/aseprite/aseprite /usr/bin/aseprite
cd ../../..

