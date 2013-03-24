---
layout: post
title: 时间序列之间的回归
date: 2012-05-05 22:25
comments: true
categories: 统计建模
---
<a href=""><img class="alignnone size-full wp-image-538" title="独立的时间序列" src="http://a.hiphotos.baidu.com/album/s%3D550%3Bq%3D90%3Bc%3Dxiangce%2C100%2C100/sign=229bf6a8d53f8794d7ff482be2207fc9/d788d43f8794a4c2cdc0f23b0ff41bd5ad6e393a.jpg?referer=b39158d0f636afc3571b0b5587d8&x=.jpg" alt="" width="379" height="282" /></a>

上图是两个独立的模拟时间序列。可能会很容易认为红线和黑线二者有依赖关系，尤其是线性回归还支持这一结论（如下图）。而真实原因是因为他们都是时间序列！如果做相关性检验则只考虑了他们距离零点的距离，不确定性被低估了，同样会得出二者“相关”的错误结论。你可能会觉得很奇怪，虽然上面的例子暗示出二者很强的相关性，却明明是独立的（如下面R的例子，使我们造出来的独立）。实际上这就涉及到了统计学为什么引入时间序列的意义。当模型是时间的函数和一个普通的噪声叠加时，普通的统计回归就够用了，此谓显式时间依赖。当一个时间点与另外时间点所发生的存在依赖性时，是时间序列才能处理的问题，就是所谓的隐式时间依赖。“时间序列之间的回归”告诉我们：有些事情你回归不了。

<a href=""><img title="回归不得哟" src="http://b.hiphotos.baidu.com/album/s%3D550%3Bq%3D90%3Bc%3Dxiangce%2C100%2C100/sign=a9ea053f94cad1c8d4bbfc224f051634/241f95cad1c8a78650b35f1e6609c93d70cf5000.jpg?referer=90808b38962bd4071bd0e6cd901e&x=.jpg" alt="" width="379" height="282" /></a>

这是一个用R写的例子：
<pre class="brush: r; gutter: true">n=100   # 观测的数量
a=0.99  # 自相关系数
mu=1    # 期望
sigma=1 # 标准差
tau=sigma*sqrt(1-a^2) # 标准差

# 序列一
x=array(NA,n)
x[1]=rnorm(1,mu,sigma)
for(i in 2:n)
  x[i]=a*x[i-1]+(1-a)*mu+rnorm(1,0,tau)

# 序列二
y=array(NA,n)
y[1]=rnorm(1,mu,sigma)
for(i in 2:n)
  y[i]=a*y[i-1]+(1-a)*mu+rnorm(1,0,tau)


# 画出二者后看起来有相关性？实际独立。
plot(1:n,x,type=&amp;quot;l&amp;quot;,ylim=c(min(c(x,y)),max(c(x,y))))
lines(1:n,y,col=&amp;quot;red&amp;quot;)

# 直接画散点图看
plot(x,y,cex=0.9)

# 用线性模型拟合居然也是显著的
linreg=lm(y~x)
abline(linreg,cex=1.5)
summary(linreg)
#Call:
#lm(formula = y ~ x)
#
#Residuals:
#     Min       1Q   Median       3Q      Max 
#-0.70823 -0.19115 -0.03474  0.19931  0.93094 
#
#Coefficients:
#            Estimate Std. Error t value Pr(&gt;|t|)    
#(Intercept)  1.37361    0.05864  23.424  &lt; 2e-16 ***
#x           -0.30180    0.06566  -4.597 1.28e-05 ***
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 
#
#Residual standard error: 0.351 on 98 degrees of freedom
#Multiple R-squared: 0.1774,	Adjusted R-squared: 0.169 
#F-statistic: 21.13 on 1 and 98 DF,  p-value: 1.282e-05 </pre>
