---
layout: post
title: Rstudio Server 安装记录
date: 2013-06-30 01:00
comments: true
categories: R
---
一直想在高性能的开发机上安装一个浏览器可以访问的Rstudio Server，这样既可以享受服务器级别计算资源，又能有完美的IDE环境，最关键是可视化数据非常方便（开发机上没有图形界面，只能命令行）。无奈由于公司的Linux系统版本太低，两年来未能如愿。这次趁着重装开发机，一鼓作气搞定，记录一下踩过的坑，下次装的话还用得上。

确认系统版本为Cent OS(5.4+)
>uname -a
>Linux xxoo.baidu.com 2.6.32_1-10-6-0 #4 SMP Sat May 25 11:47:28 CST 2013 x86_64 x86_64 x86_64 GNU/Linux 
或者
>cat /etc/issue
>CentOS release 6.3 (Final)
>Kernel \r on an \m

安装R，记得要生成几个.so的文件
>wget http://ftp.ctex.org/mirrors/CRAN/src/base/R-3/R-3.0.1.tar.gz
>./configure --enable-R-shlib --with-blas=yes --with-lapack=yes --with-x=no
>make & make install

去刚才安装R的目录，看下对应的.so文件是否装好
>which R
>/usr/local/bin/R
>ls -1 /usr/local/lib64/R/lib
>libR.so
>libRblas.so
>libRlapack.so

打开~/.bashrc，添加如下一行
>export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64/R/lib/

确认以下动态链接库已经安装（已安装的话可以无视这段话）
libcairo.so.2
libcrypto.so.6
libgfortran.so.1
libpango-1.0.so.0
libpangocairo-1.0.so.0
libssl.so.6
否则可以
>yum install libcrypto.so.6
>yum install libgfortran.so.1
>yum install openssl098e-0.9.8e

最后一步就是安装rstudio server了
>wget http://download2.rstudio.org/rstudio-server-0.97.551-x86_64.rpm
>rpm -Uvh --nodeps rstudio-server-0.97.551-x86_64.rpm
>rstudio-server verify-installation
>Stopping rstudio-server:                                   [  OK  ]
>Starting rstudio-server:                                   [  OK  ]

出现如上OK就说明大功告成了，就可以直接用浏览器访问远程服务器上的R了，至少具有如下优点：
1.  任何操作系统的电脑在任何位置都可访问R工作空间并可以保存；
2.  非常易于分享代码，数据以及任何工作文件（设想一下，你作为公司数据分析师到客户那里做咨询或培训，使用客户电脑和RStudio Server就能直接利用公司主机上的数据集和程序代码作演示，而不必携带厚重的笔记本出差，这样岂不轻松又显得高端大气上档次。via 王熙）；
3.  多用户共享更强力的服务器级计算资源（12核64G内存起步价，不过注意要给每个用户建立账号，这样保证工作空间不互相干扰）
4.  统一安装配置R的各种包，文档，IDE支持，包括画图。

最后来张效果图：
<img class="alignnone" alt="" src="http://b.hiphotos.bdimg.com/album/w%3D1600%3Bq%3D90/sign=a3b0e6b7738b4710ce2ff9caf3fef88c/7acb0a46f21fbe097272dd826a600c338744ad73.jpg" width="1101" height="760" />

