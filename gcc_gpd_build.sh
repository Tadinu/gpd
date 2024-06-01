mkdir -p build && pushd build
cmake .. -DCMAKE_INSTALL_PREFIX=../release #-DPCL_DIR=/home/tad/1_MUJOCO/pcl/release/share/pcl-1.14/
make -j 8
make install
popd
cp build/*.a release/lib/
