#### This repo is forked from [/zeakey/ez-install](https://github.com/Hzzone/ez-install)

The BLVC/Caffe One-Step installation is only approiate for Ubuntu user

I have tried it on my Ubuntu 17.04 LTS machine

If it warns an error `***.h No such file or directory` and then compilation terminated when compiling opencv, please `modify sourcefile` according to the errors, which I think are resulted from `precompile-headers when cmake`

​On the basis of the original repo, it can accelerate download(pip-install and git clone) for CN:cn: users

#### 中文版

安装只需要按照例子中的做，我在原作者的基础上:
* `pip`使用了国内源和`git clone /BLVC/Cafffe`时只复制最新版本
* 使用了原作者的opencv下载地址，并且避免了重新编译时重复下载该文件
* 新装系统必备的依赖，防止因为缺少依赖重新编译
* 如果在编译opencv时报`No such file or directory`的错误，根据错误修改相应位置的源码，将`include_next`修改为`include`


# Easy Install

You just type `bash install-xx.sh` and we do the rest.

## Example
**Install caffe:**
```bash
cd ~/ && git clone --depth 1 https://github.com/Hzzone/ez-install.git
sudo bash ~/ez-install/install-caffe.sh
export PYTHONPATH=/path/to/caffe/python:$PYTHONPATH
python
>>import caffe
>>if nothing, caffe has installed successfully
```

```shell
# 上述只对一个终端界面有效，关闭后有需要重新设置
# 将caffe永久添加到python环境的方法
cd /usr/lib/python2.7/dist-packages
sudo vim caffe.pth
# add /path/to/caffe/python
# wq
# Test
```



​*There are alternative links for CN:cn: users to accelerate download due to some special reasons.*

Any problem, don't hesitate to create an [Issue](https://github.com/zeakey/ez-install/issues).
