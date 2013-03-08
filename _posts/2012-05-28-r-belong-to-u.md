---
layout: post
title: 属于你的R
date: 2012-05-28 23:17
comments: true
categories: []
---
Linux下的R用户可以自由定制自己的环境。首先由环境变量R_PROFILE指定初始化文件位置，它的优先级最高；如果该变量没有设置，则找到R安装目录下的子目录etc里的Rprofile.site文件，优先级其次。在此之后再通过查找当前目录下添加的.Rprofile文件（如果没有则去当前用户的根目录下找）来实现，优先级最低。还有两个特殊的函数，包括对话开始时自动执行的.First()可用于初始化环境，以及对话结束时自动执行的.Last()可用于保存环境。举个例子，比如我们在~/.Rprofile文件里写入函数就有如下功能。
<pre class="brush: r; gutter: true">.First &lt;- function() {
       options(prompt=&quot;$ &quot;, continue=&quot;+\t&quot;)  # 用 $ 作为提示符
       options(repos = c(CRAN=&quot;http://ftp.ctex.org/mirrors/CRAN/&quot;))
                                             # 选择速度最快的CRAN源
       options(digits=5, length=999)         # 指定数值和打印范围
       x11()                                 # 指定图形界面
       par(pch = &quot;+&quot;)                        # 默认画图的字符
       source(file.path(Sys.getenv(&quot;HOME&quot;), &quot;R&quot;, &quot;mystuff.R&quot;))
                                             # 加载私有函数
       library(MASS)                         # 加载常用的包
     }

.Last &lt;- function() {
       graphics.off()                        # 一个小的安全措施
       cat(paste(date(),&quot;\nAdios\n&quot;))        # Is it time for lunch?
	if (!any(commandArgs()==&#039;--no-readline&#039;) &amp;&amp; interactive()){
		require(utils)
		try(savehistory(Sys.getenv(&quot;R_HISTFILE&quot;)))
	}                                        # 记录历史命令，但是要预先在.bashrc里定义地址
                                             # export R_HISTFILE=~/.Rhistory
     }</pre>
当然.Rprofile文件里还可以写入一些其他的自定义函数，分享在我的开发机上简单但强大的两个小函数。
<pre class="brush: r; gutter: true"># 默认q可直接退出R
q &lt;- function (save=&quot;no&quot;, ...) {
    quit(save=save, ...)
}

# 用R.log记录所有输出
sink(file = &#039;R.log&#039;, split=T)</pre>
<pre class="brush: r; gutter: true"></pre>

但是注意到执行全部删除命令rm(list=ls())时，自定义函数也会被删除掉（比如上面的q()和sink()），但如果用new.env()先定义新的命名空间就不会被删，比如以下head,names,tail及summary的alias。 

<pre class="brush: r; gutter: true">.startup &lt;- new.env() 
assign(&quot;h&quot;, utils::head, env=.startup) 
assign(&quot;n&quot;, base::names, env=.startup) 
assign(&quot;ht&quot;, function(d) rbind(head(d,5),tail(d,5)) , env=.startup) 
assign(&quot;s&quot;, base::summary, env=.startup) 
attach(.startup)</pre>
最后提供一个sof上很强大的ls函数的改进，可以显示内存中所有对象类型、占用内存大小及维数等信息，简直相当于linux中ls命令的-a选项了。
<pre class="brush: r; gutter: true">.ls.objects &lt;- function (pos = 1, pattern, order.by,
		decreasing=FALSE, head=FALSE, n=5) {
		napply &lt;- function(names, fn) sapply(names, function(x)
				fn(get(x, pos = pos)))
			names &lt;- ls(pos = pos, pattern = pattern)
			obj.class &lt;- napply(names, function(x) as.character(class(x))[1])
			obj.mode &lt;- napply(names, mode)
			obj.type &lt;- ifelse(is.na(obj.class), obj.mode, obj.class)
			obj.size &lt;- napply(names, object.size)
			obj.dim &lt;- t(napply(names, function(x)
						as.numeric(dim(x))[1:2]))
			vec &lt;- is.na(obj.dim)[, 1] &amp; (obj.type != &quot;function&quot;)
			obj.dim[vec, 1] &lt;- napply(names, length)[vec]
			out &lt;- data.frame(obj.type, obj.size, obj.dim)
			names(out) &lt;- c(&quot;Type&quot;, &quot;Size&quot;, &quot;Rows&quot;, &quot;Columns&quot;)
			if (!missing(order.by))
				out &lt;- out[order(out[[order.by]], decreasing=decreasing), ]
			if (head)
				out &lt;- head(out, n)
				out
}

ll &lt;- function(..., n=10) {
	.ls.objects(..., order.by=&quot;Size&quot;, decreasing=TRUE, head=TRUE, n=n)
}</pre>
