---
layout: post
title: 素数机的几种R实现及效率比较
date: 2011-08-06 20:35
comments: true
categories: R
---
<pre class="brush: r; gutter: true">prime&lt;-function(m){
  x&lt;-c(2:m)
  y&lt;-NULL
  repeat{
    z&lt;-x[(x%%x[1])!=0]
    y&lt;-c(y,x[1])
    if(x[1]&gt;sqrt(m))break
    x&lt;-z
    }
  c(y,z)
}

primeL&lt;-function(m){
  if(m&lt;=3L)return(seq(1,max(1,m))[-1L])
  x&lt;-seq(from=3L,to=as.integer(m+.5),by=2L)
  y&lt;-2L
  stop.val&lt;-as.integer(ceiling(sqrt(m)))
  repeat{
    z&lt;-x[(x%%x[1L])!=0L]
    y&lt;-c(y,x[1L])
    if(x[1]&gt;=stop.val)break
    x&lt;-z
    }
  c(y,z)
}

primeS &lt;- function(m)
{
  if(m==2)cat(&#039;2&#039;)
  else if(m==2)cat(&#039;2 3&#039;)
  else{
    a&lt;-2:m
    b&lt;-floor(sqrt(m))
    sapply(2:b,function(y){n&lt;-seq(y^2,m,y);a[n-1]&lt;&lt;-0})
    return(a[which(a!=0)])
    }
}

primeS2 &lt;- function(m)
{
  if(m==2)cat(&#039;2&#039;)
  else{
    a&lt;-c(2,seq(3,m-sum(m%%2==0),2))
    b&lt;-floor((sqrt(m)-1)/2)
    if(b!=0) sapply(1:b,function(y){
      n&lt;-seq((2*y^2+2*y+1),ceiling(m/2),2*y+1);
      a[n] &lt;&lt;- 0})
    else a &lt;- a
    return(a[which(a!=0)])
    }
}

all((prime(1e6)==primeS2(1e6))&amp;
  (primeL(1e6)==primeS2(1e6))&amp;
  (primeS(1e6)==primeS2(1e6)))
#[1] TRUE

system.time(prime(1e7))
system.time(primeL(1e7))
system.time(primeS(1e7))
system.time(primeS2(1e7))
#  用户  系统   流逝
#13.07  0.00 13.08
# 9.99  0.00  9.98
# 5.78  0.00  5.81
# 1.51  0.02  1.55</pre>
筛法真是古老而优雅，primeL效率更高的缘故可能在于首先就排除了所有偶数，然后用L将index固定为int。后面两种效率更高可能在于sapply()的向量化操作，找到的是素数所在的位置。不过简洁到变态的是正则表达式
<pre class="brush: r; gutter: true">perl -e&#039;$|++;(1 x$_)!~/^1?$|^(11+?)\1+$/&amp;&amp;print&quot;$_ &quot;while ++$_&#039;</pre>
这里还有一个80年代的线性时间素数筛法
<pre class="brush: r; gutter: true">#linear_prime_sieves
#prime[]，存储n以内所有的素数，其index为pi，初值为0
#is_prime[i]，表示自然数i(i&lt;=n)是否质数，False就不是
  set is_prime[] to true
  for i=2 to n
    if is_prime[i]=true then prime[pi++]=i
    for j=0 to pi-1
      if prime[j]*i&gt;n then exit loop_j
      is_prime[prime[j]*i]=false
      if i mod prime[j]=0 then exit loop_j
    endif
  endif</pre>
来自"P. Pritchard. Linear prime-number sieves: A family tree. Science of Computer Programming, 9:17-35, 1987"。
