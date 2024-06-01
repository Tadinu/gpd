# Ubuntu 20.04: clang-10
# Ubuntu 22.04: clang-11/12/13
#sudo apt update
#sudo apt install libc++-dev
#sudo apt install libc++abi-dev
mkdir -p build
pushd build
cmake .. -DCMAKE_C_COMPILER:STRING=clang-15 -DCMAKE_CXX_COMPILER:STRING=clang++-15 \
		 -DCMAKE_INSTALL_PREFIX=../release \
		 -DCMAKE_CXX_FLAGS:STRING="-stdlib=libc++ -D_GLIBCXX_USE_CXX11_ABI=1" \
		 -DCMAKE_EXE_LINKER_FLAGS:STRING="-Wl,--no-as-needed -stdlib=libc++" \
		 -DPCL_DIR=/home/tad/1_MUJOCO/pcl/release/share/pcl-1.14/
cmake --build . -j8
cmake --install .
popd

cp build/*.a release/lib/
