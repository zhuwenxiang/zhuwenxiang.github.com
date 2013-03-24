---
layout: post
title: 繁花规的R实现
date: 2011-08-05 21:12
comments: true
categories: R
---
<a href="http://baike.baidu.com/view/2853480.htm" target="_blank">繁花规</a>是一种玩具，大塑料圆片的内侧和小塑料圆片的外侧有可啮合的齿轮，用不同颜色的笔在圆片上某个小孔随齿轮自然移动，就可画出繁复而美丽的图案。可能大家小时候都玩过吧，或者像我一样玩过，但是当时却不知道它叫做繁花规。

从几何的观点看，繁花规的本质就是记录小圆在大圆里面转动的时候，小圆上某一点的轨迹。利用R的作图功能给出了繁花规的实现，把下面这段代码复制进RGui里面运行即可。如果给fanhuagui()函数设置不同的rate参数，就可以得到不同样子的图案。快试试自己的生日是什么样子的吧。
<pre class="brush: r; gutter: true">#make circle
circle &lt;- function(o = c(0,0), r, n = 720, append=F,...)
{
  x &lt;- 0:n
  theta &lt;- x*2*pi/n
  if(append)
  {
    polygon(o[1] + r*cos(theta), o[2] + r*sin(theta),...)
  }
  else
  {
    plot(o[1] + r*cos(theta), o[2] + r*sin(theta), xlab="", ylab="",
    main="繁花规", axes=F, type="n", asp=1,...)
    polygon(o[1] + r*cos(theta), o[2] + r*sin(theta),...)
  }
  points(o[1], o[2], pch=16,...)
}

#rate belongs to (-1,1)
fanhuagui &lt;- function(rate1, rate2, N, color)
{
  R=1;
  r=R*rate1;
  d=r*rate2;
  c0&lt;-c(R-r+d, 0)
  for(theta in seq(0, N*2*pi, length = N*36))
  {
    o1 = c((R-r)*cos(theta), (R-r)*sin(theta))
    circle(r = R, col = 0, append = F)
    circle(o = o1, r = r, col=0, append = T)
    c0 &lt;- rbind(c0, c(d*cos(-theta*R/r), d*sin(-theta*R/r)) + o1)
    lines(rbind(o1, c(d*cos(-theta*R/r), d*sin(-theta*R/r)) + o1), col=0)
    lines(c0, col = color)
  }
}

#have a try
fanhuagui(1.1,0.4,20,4)
fanhuagui(0.7,1.1,20,4)
fanhuagui(0.3,0.8,20,4)
fanhuagui(0.1,1.2,20,4)</pre>
代码中几个例子画出的图：

<a href="http://h.hiphotos.baidu.com/album/s%3D550%3Bq%3D90%3Bc%3Dxiangce%2C100%2C100/sign=b1d46dec3b87e9504617f3692003227e/3bf33a87e950352ac18847275243fbf2b2118b37.jpg?referer=beeccc4f4ec2d562ab1fe4ddf5ed&x=.jpg"><img class="alignleft size-full wp-image-73" title="繁花规" src="http://h.hiphotos.baidu.com/album/s%3D550%3Bq%3D90%3Bc%3Dxiangce%2C100%2C100/sign=b1d46dec3b87e9504617f3692003227e/3bf33a87e950352ac18847275243fbf2b2118b37.jpg?referer=beeccc4f4ec2d562ab1fe4ddf5ed&x=.jpg" alt="" width="965" height="967" /></a>
