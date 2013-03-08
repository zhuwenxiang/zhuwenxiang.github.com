---
layout: post
title: R的高性能计算
date: 2011-11-04 01:55
comments: true
categories: []
---
<a href="http://cran.r-project.org/web/views/HighPerformanceComputing.html">高性能计算</a>一直是R语言的瓶颈，诸如单进程、所有数据常驻内存等缺点也一直困扰着我。但随着对开源事业支持的不断增强，包括R核心开发小组在半年钱R 2.13版本中加入了编译功能包 compiler，在刚发布的R 2.14版本中又加入了官方分布式算法包 parallel，以及 <a href="http://www.oracle.com/technetwork/articles/datawarehouse/saternos-r-161569.html">Oracle</a>、<a href="http://ml.stat.purdue.edu/rhipe/">Hadoop</a>等厂商及平台提供越来越多的支持，这个瓶颈正有望逐步得到解决。

先说向量化。向量是相对于标量而言，向量的特点是有大小还有方向，标量只有大小没有方向。如果说标量是各为其主的单打独斗（显式循环），那么向量就是方向一致的集体作战（隐式循环）。向量化就是把同个指令应用于一个数组、向量或者矩阵。简单的，比如在R中得到矩阵的第1行可以用M[1,]，赋值给矩阵的第1列可以用M[,1]&lt;-，这些实际上在底层语言中可能需要for循环的事情，在这里都避免了。再比如R最精华的 apply系列函数，实际上也就是一类向量化操作。就是把一个函数（一种操作），直接给施加行或者列上去。

分布式计算是向量化的自然延伸，实际上就是对于互相独立而且并列的计算需求，将其分配到不同的计算结点里去做，最后再做集成。出于两种需求可能需要使用分布式：第一是单核计算费时，实际上计算按行或者按列各slave可以独立，分散到多核可以减少计算时间；第二，一台机器内存不足以进行计算（特别对R），不得不分配到多台机器上去计算时，这时即使时间上会有损失也是可以接受的。R中提供了好几种分布式计算的方式，这里使用 snow包的简化版 snowfall旨在做个简要说明。

演示代码及运行时间如下：
<pre class="brush: r; gutter: true">##输入一个时间序列，则返回其自适应模型所对应预估值
myforecast &lt;- function(x){
	library(&quot;forecast&quot;, quietly = TRUE)
		fit &lt;- auto.arima(x)
		prd &lt;- forecast(fit, h = 1)$mean
		return(as.numeric(prd))

}

#for循环
TestFor &lt;- function(M){
	    predict = numeric(nrow(M))
		for(i in 1:nrow(M)){
			predict[i] = myforecast(M[i,])
			}
}

#向量化计算
TestApply &lt;- function(M){
	    return(apply(M, 1, myforecast))
}

#分布式计算
TestSnowfall &lt;- function(M, cpus){
	library(&quot;snowfall&quot;, quietly = TRUE)
		sfInit(parallel = TRUE, cpus = cpus)
		predict &lt;- sfApply(M, 1, myforecast)
		sfStop()
		return(predict)
}

#模拟计算并计时
mat.consume = matrix(rnorm(3000*20), ncol=20)
cpus &lt;- as.numeric(system(&quot;cat /proc/cpuinfo | grep processor | wc -l&quot;, intern = TRUE))
#system.time(predict.for &lt;- TestFor(mat.consume))
system.time(predict.apply &lt;- TestApply(mat.consume))
system.time(predict.snowfall &lt;- TestSnowfall(mat.consume, cpus))

#检验预估值是否一样
#sum(predict.apply-predict.for)
sum(predict.apply-predict.snowfall)</pre>
<pre>&gt; system.time(predict.apply &lt;- TestApply(mat.consume))</pre>
<pre>   user  system elapsed
620.475   0.150 &lt;span style=&quot;color: #ff0000;&quot;&gt;620.660&lt;/span&gt;
&amp;gt; system.time(predict.snowfall &amp;lt;- TestSnowfall(mat.consume, cpus))
   user  system elapsed
  0.144   0.033  &lt;span style=&quot;color: #ff0000;&quot;&gt;65.576&lt;/span&gt;</pre>
