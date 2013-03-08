---
layout: post
title: R的思维方式
date: 2012-03-29 23:03
comments: true
categories: []
---
<p align="left">最近在重构模型代码中使用awk比较多，发现有几个特别能反映出R作为函数式语言与其他诸如awk\sed\C等命令式语言风格迥异的地方，举两个例子以说明。</p>
<p align="left">例1：推荐系统实践中对一个关键feature“兴趣近似度”的计算。比如一批user去给一批item打分，比如u1的打分记录有t1, t2, ..., u2的打分记录有t2, t3, ...每个用户评分的item数目可能不等，要求输出一个表T, T(i, j)是用户 i 和 j 都打过分的item个数，实际上这可以粗略衡量二者兴趣上的近似。</p>
<p align="left">先给出awk的解决方案：</p>
首先需要根据访问记录record.txt即user-&gt;item对，来建立一个item的访问字典，用来记录每个item都被哪些user打分过，即item-&gt;{user_set}。然后根据一个文件被打分的记录集合{user_set}得到所有共同出现过的user对。最后基于user字典遍历user对，给每一对打分过某item的用户的相应计数加1，这样就完成了计数。record.txt的内容是：
a 1
a 2
a 3
a 4
b 1
b 3
b 4
c 1
c 4
d 2
d 3

统计共同评分的stat.sh代码如下：
<pre class="brush: bash; gutter: true">#/bin/bash

awk &#039;{

       dict[]=dict[]&quot;\t&quot;;

}END{

       for(i in dict)   print i,dict[i];

}&#039; record.txt |

awk &#039;BEGIN{

       while(getline&lt;&quot;record.txt&quot;) {

              user_dict[]=1;

              item_dict[]=1;

       }

}

{

       for(i=2;i&lt;=NF;i++){

              for(j=i+1;j&lt;=NF;j++){

                     same[$i&quot;\t&quot;$j]+=1;

              }

       }

}END{

              for(user1 in user_dict){

                     for(user2 in user_dict)

                     {

                            if(same[user1&quot;\t&quot;user2]) print user1,user2,same[user1&quot;\t&quot;user2];

                     }

              }

}&#039;</pre>
结果是：
a b 3
a c 2
a d 2
b c 2
b d 1
<p align="left">awk或者更高级的语言如python都可以使用dict(字典)那样的数据结构，但这个表面上可能需要依靠数据结构才能解决的问题，我们可以用R给出一个更漂亮的解答。给出代码之前，先做点数学上的分析。令F是一个矩阵，F(u, t) = 1代表u打分过t，否则F(u, t) = 0。那么T其实就可以写成：T(u1, u2) = sum_t F(u1, t) F(u2, t) ，其中sum_t表示按t遍历求和。容易看地出这就是u1, u2都打过分的item，写成矩阵形式就是：T = F * F'</p>
我们只用两行R代码就可以解决这个问题，其中还有一行是读数据
<pre class="brush: r; gutter: false">&gt; record&lt;-read.table(&quot;record.txt&quot;)

&gt; table(record)%*%t(table(record))

   V1

V1  a b c d

  a 4 3 2 2

  b 3 3 2 1

  c 2 2 2 0

  d 2 1 0 2</pre>
<p align="left">实际情况中评分都是很稀少的，因此这里如果用sparse matrix的办法处理矩阵相乘，运算复杂度会大大降低，并且只依赖于实际打分的数量。通过R的matrix包给出的矩阵乘法比awk语言的实现更快（不要试图用awk实现稀疏矩阵乘法，工作量太大）。这里其实充分体现了R的向量化思想，即先用打分向量record构造定义出每个user的item矩阵table(record)，进而用内积实现统计。说句题外话，如果把item也换成user，评分换成有好友关系，那么这个例子可以直接用于产生俩人的共同好友数，同时也是QQ圈子使用的重要指标。</p>
<p align="left">例2：给出一组数字，算出每个不同数字出现的次数。</p>
其实这就是以上table函数的功能。但是我们不会那么赖皮，这次用R给出一个用排序解决的算法
<pre class="brush: r; gutter: true">
(a&lt;-sample(100, replace=T))
(s&lt;-sort(a))
(dp&lt;-c(which(diff(s)!=0),length(s)))
(t = rbind(s[dp],diff(c(0,dp))))
</pre>
其实用awk实现也很简单，只需要一个字典来快速定位某个数字的计数器（虽然数据量大的时候可能会受到内存限制）。不过二者体现了不太一样的思维方式，类似awk的命令式语言倾向于通过数据结构来加速每个元素的处理，而类似R的函数式语言不去考虑复杂的数据结构，更注重于能否以向量化的方式对整体进行操作。
