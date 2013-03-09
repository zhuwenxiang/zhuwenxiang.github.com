---
layout: post
title: R的函数式编程
date: 2012-03-28 00:12
comments: true
categories: R
---
R语言继承自两门语言：S/S-PLUS 和 Scheme。 前者是贝尔实验室开发的用于统计分析的解释性语言，S即是Statistics的缩写，Splus是基于S语言的商业软件。后者Scheme是Lisp的一种方言，其特点是没有数据和代码之分，利用各种嵌套递归自己建造自己，高度抽象和数学化。比如退出R环境的命令用q()就类似Scheme。在这里暂不提来自S的那一边，考虑R与另一边即Scheme的联系：R 的向量化、函数式编程就都继承自这一方。函数式编程，即函数也是数据的思想，可以用函数返回自己需要的函数，可以提高编码效率，避免代码的复制粘贴。先举个简单例子予以说明：
<pre class="brush: r; gutter: true">Power &lt;- function(n){
function(x)x^n
}
Harmonic &lt;- Power(-1)
Cube &lt;- Power(3)
#Harmonic(1:5)
#[1] 1.000 0.500 0.333 0.250 0.200</pre>
<p class="brush: r; gutter: true">接下来看看函数式编程在自定义运算中的应用。我们知道在R中所有的运算符都对应着函数，如a+b实际上是对应着`sum`(a,b)，那么运算符除了+-*/ 加减乘除外还有^ 指数，另外还有特殊的如%% 取模，%/% 整数除法，%*% 矩阵乘法，%o% 外积，%x% Knronecker 乘积，%in% 匹配等。实际上所有的运算符号都是函数，都可以用</p>

<pre class="brush: r; gutter: true">`%c%` = function(x,y)function(...)x(y(...))</pre>
<p class="brush: r; gutter: true">的方式来定义，下面是两个例子：</p>

<pre class="brush: r; gutter: true"># via R help
1:10 %in% c(1,3,5,9)
sstr &lt;- c(&quot;c&quot;,&quot;ab&quot;,&quot;B&quot;,&quot;bba&quot;,&quot;c&quot;,NA,&quot;@&quot;,&quot;bla&quot;,&quot;a&quot;,&quot;Ba&quot;,&quot;%&quot;)
sstr[sstr %in% c(letters, LETTERS)]
&quot;%w/o%&quot; &lt;- function(x, y) x[!x %in% y] #--  x without y
(1:10) %w/o% c(3,7,12)
# op defination
`%c%` = function(x,y)function(...)x(y(...)) 
numericNA = is.na %c% as.numeric
numericNA(c(1,&quot;a&quot;))</pre>
<p class="brush: r; gutter: true">有关函数递归调用还可以举个例子</p>

<pre class="brush: actionscript3; gutter: true">myFactorial &lt;- function(x)(function(n) {
if (n&lt;=1) 1 else n*Recall(n-1)})(x)</pre>
<p class="brush: r; gutter: true">最后说明一点，其实所有的apply系列函数，其function(x)就是把函数当做参数传入的，关于Reduce等函数给个R base包中<a href="http://stat.ethz.ch/R-manual/R-patched/library/base/html/funprog.html" target="_blank">funprog</a>的参考链接。</p>
<p class="brush: r; gutter: true"></p>
