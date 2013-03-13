---
layout: post
title: 任意两个自然数互素的概率有多大
date: 2011-08-09 12:31
comments: true
categories: 概率
---
<pre>latexpage</pre>
<pre>解法1
Lemma1: $1+\frac{1}{2^2}+\frac{1}{3^2}+\frac{1}{4^2}+\frac{1}{5^2}+\ldots=\frac{{\pi}^2}{6}$
Lemma2: 若任意两个自然数互素的概率为$p$，则任意两个自然数最大公约数为k的概率为$p*\frac{1}{k^2}$
Lemma1来自数学分析。Lemma2的证明我们分为两点。</pre>
<pre>根据全概率公式，$p$(k是a,b最大的公因子)=$p$(k是a,b最大的公因子|k是a,b公因子)。</pre>
<pre>又假设a=m*k，b=n*k，则"m,n互素"等价于"k是a,b的最大公因子"。
“k是a,b的公因子”前提下，m,n也等价于任意两个自然数，所以它们互素的概率为p。此其一。
对任意自然数k，则k为a,b的公因子的概率是$\frac{1}{k^2}$(即a,b同为k的倍数的概率)。此其二。
根据Lemma任意两个自然数不互素的概率为1-p，也是有大于2的最大公因子(不妨设为k)的概率。</pre>
<pre>对k取大于2的全部自然数有$p*\frac{1}{2^2}+p*\frac{1}{3^2}+\ldots=1-p$，变换即可。</pre>

<pre>解法2
设任意两个自然数为m,n。$\{p_k\}$为所有素数的集合。一个自然数有因子$p_k$的概率为$\frac{1}{p_k}$。</pre>
<pre>m,n同时有因子$p_k$的概率为$\frac{1}{(p_k)^2}$。所以m,n不同时有因子$p_k$的概率为$1-\frac{1}{(p_k)^2}$。</pre>
<pre>所谓的m,n互素，即对于所有的k，两者不同时有因子$p_k$。显然这个概率就是$\prod_{k=1}^{\infty}(1-\frac{1}{(p_k)^2})$</pre>
<pre>而上面这个乘积极限的倒数就等于$\sum_{k=1}^{\infty}\frac{1}{k^2}$，实际上这是因为</pre>
<pre>$\frac{1}{1-\frac{1}{(p_1)^2}}=1+\frac{1}{(p_1)^2}+\frac{1}{(p_1)^4}+\ldots$</pre>
<pre>$\frac{1}{1-\frac{1}{(p_2)^2}}=1+\frac{1}{(p_2)^2}+\frac{1}{(p_2)^4}+\ldots$</pre>
<pre>$\vdots$</pre>
<pre>$\frac{1}{1-\frac{1}{(p_n)^2}}=1+\frac{1}{(p_n)^2}+\frac{1}{(p_n)^4}+\ldots$</pre>
<pre>$\vdots$</pre>

<pre>将以上各式相乘（再加以极限的概念）得到的通项为</pre>
<pre>$\frac{1}{p_{i_1}^{2{n_1}}*p_{i_2}^{2{n_2}}*\cdots*p_{i_m}^{2{n_m}}}$</pre>
<pre>通项中的每一项均是$1+\frac{1}{2^2}+\frac{1}{3^2}+\frac{1}{4^2}+\frac{1}{5^2}+\ldots$的其中一项且不存在重复。</pre>
<pre>反之后式的任意一项也可以表示为前者的通项，这根据算数基本定理：自然数可唯一质分解。</pre>