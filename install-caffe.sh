#!/bin/bash
# install common deps
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential cmake make
sudo apt-get install -y --no-install-recommends libboost-all-dev
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev
sudo apt-get install -y libatlas-base-dev
sudo apt-get install -y python-dev
# install OpenCV
if [[ "$(which opencv_version)" == '' ]]; then
    echo "Installing OpenCV ..."
    sudo bash install-opencv.sh
fi
# install python deps
if [[ "$(which pip)" == '' ]]; then
    # curl https://bootstrap.pypa.io/get-pip.py
    # alternative link for CN users
    curl http://zhaok-data.oss-cn-shanghai.aliyuncs.com/service/get-pip.py | sudo -H python
else
    sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ --upgrade pip
fi
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ numpy scipy Cython
if [ ! -d /usr/lib/python2.7/dist-packages/numpy ]; then
    sudo ln -s /usr/local/lib/python2.7/dist-packages/numpy /usr/lib/python2.7/dist-packages/numpy
fi
echo '#numpy include path' >> ~/.bashrc
echo 'export CPATH=/usr/local/lib/python2.7/dist-packages/numpy/core/include:$CPP_INCLUDE_PATH' >> ~/.bashrc
echo 'export CPATH=/usr/local/lib/python2.7/dist-packages/numpy/core/include:$C_INCLUDE_PATH' >> ~/.bashrc
. ~/.bashrc
sudo apt-get install -y python-tk  # tkinter cannot install with pip
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ scikit-image scikit-learn
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ matplotlib
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ ipython jupyter
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ protobuf
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ h5py leveldb lmdb
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ networkx nose
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ pandas
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ python-dateutil
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ python-gflags pyyaml Pillow six pyzmq singledispatch
sudo -H pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ backports_abc certifi jsonschema graphviz  qtawesome pydot
# clone caffe source code
cd ~/ && git clone --depth 1 https://github.com/BVLC/caffe && cd caffe
mkdir build && cd build
cmake -DCPU_ONLY=ON .. && make -j$(nproc)
## some other cmake examples ##
# build with cuda, cudnn and nccl
# cmake -USE_NCCL=ON -DNCCL_INCLUDE_DIR=/pkg/nccl/include -DNCCL_LIBRARIES=/pkg/nccl/lib \
# -DCUDNN_INCLUDE=/usr/local/cudnn/include -DCUDNN_LIBRARY=/usr/local/cudnn/lib64 ..

echo "Done! Built caffe source at '~/caffe'"

# try caffe MNIST example:
# cd ~/caffe
# bash data/mnist/get_mnist.sh
# bash examples/mnist/create_mnist.sh
# bash examples/mnist/train_lenet.sh
