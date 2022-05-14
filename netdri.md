


### 下载驱动

[link](https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software)

安装命令
    cd /usr/src/ && sudo tar -xvf r8125-9.009.00.tar.bz2 && cd r8125-9.009.00

新建dkms.conf

[link](./dkms.conf)

    sudo dkms add -m r8125 -v 9.009.00 && sudo dkms build -m r8125 -v 9.009.00 && sudo dkms install -m r8125 -v 9.009.00 && sudo depmod -a && sudo modprobe r8125

enp6s0: 外接网卡英特尔网卡无需驱动


enp7s0: 主板网卡不怎么好用


### 注意

`一更新内核需要重新安装`指的是enp7s0: 主板网卡不怎么好用

更新内核后重新安装命令


    make clean

    sudo dkms add -m r8125 -v 9.009.00 ###好像可以直接跳过这步

    sudo dkms build -m r8125 -v 9.009.00

    sudo dkms install -m r8125 -v 9.009.00

    sudo depmod -a

    sudo modprobe r8125