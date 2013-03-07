---
layout: post
title: 类似R中table函数的awk实现
date: 2012-12-20 21:36
comments: true
categories: []
---
有时候懒得打开R重复read然后table的过程，可以使用如下方法。
cat file
A 235
B 698
C 1425
A 980
C 800
B 120
A 1000
C 1578
B 1899
C 2000
1） table之一维统计
要求统计file中第一列的分布
cat file|awk '{CMD[$1]++;count++;}END { for (a in CMD)print CMD[a] " " CMD [a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl
1 4 40% C
2 3 30% B
3 3 30% A
2）table之二维统计
要求给出二维的列联表，value每500为一个阶梯，大于1500的算在一起：
<pre class="brush: r; gutter: true">cat file|awk&#039;BEGIN{print &quot;name 0-499 500-999 1000-1499 &gt;=1500&quot;}{a[];i=int(/500);if(i&lt;3)b[,i]++;else b[,3]++}END{for(j in a){printf j&quot; &quot;;for(k=0;k&lt;=3;k++)printf b[j,k]+0&quot; &quot;;print &quot;&quot;}}&#039; file | column –t
name  0-499  500-999  1000-1499  &gt;=1500</pre>
A 1 1 1 0
B 1 1 0 1
C 0 1 1 2
