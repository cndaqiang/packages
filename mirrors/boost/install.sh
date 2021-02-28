tar --bzip2 -xf boost_1_66_0.tar.bz2
cd boost_1_66_0/
./bootstrap.sh --prefix=$ROOT/boost_1_66_0
./b2 install

