tar xzvf lrzsz-0.12.20.tar.gz
cd lrzsz-0.12.20
./configure --prefix=$HOME/soft/lrzsz
make
make install
cd $HOME/soft/lrzsz/bin
ln -s lrz rz
ln -s lsz sz
echo PATH='$PATH:'$PWD >> ~/.bashrc
