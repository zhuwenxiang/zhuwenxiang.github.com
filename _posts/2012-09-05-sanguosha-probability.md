---
layout: post
title: 一道三国杀概率题的三种解法
date: 2012-09-05 12:39
comments: true
categories: []
---
今天组里有同学问：三国杀108张牌随机均分成三份，两张诸葛连弩在同一份的概率是多少？大家群策群力给出三种解法。

普通解法
三堆中先选出不包含连弩的是哪两堆，其中一堆在除去两张诸葛连弩后的106张中选36张，另外一堆剩下70张选36张：C(2,3)*C(36,106)*C(36,70)/C(36,108)*C(36,72)=35/107

文艺解法
假设黑连弩在其中一份，剩下107张牌中，红连弩是黑连弩那一份中35张牌中的一张的概率：35/(35+36+36)=35/107

二逼解法

<pre class="brush: r; gutter: true">n&lt;-1e6
m&lt;-numeric(n )
s&lt;-1:108
&quot;%w/o%&quot; &lt;- function(x, y) x[!x %in% y] #--  x without y

for(i in 1:n){
  a&lt;-sample(s,36,replace=F)
  b&lt;-sample(s %w/o% a,36,replace=F)
  c&lt;-s %w/o% c(a,b)
  m[i]&lt;-any(all(c(1,2) %in% a),all(c(1,2) %in% b),all(c(1,2) %in% c))
}
p&lt;-sum(m)/n</pre>
