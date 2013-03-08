---
layout: post
title: 线性模型解决“学前班数学题”
date: 2012-04-30 14:54
comments: true
categories: []
---
<a href="http://www.zhuwenxiang.com/wp-content/uploads/2012/04/count_circles.jpg"><img class="size-full wp-image-501 alignnone" title="count_circles" src="http://www.zhuwenxiang.com/wp-content/uploads/2012/04/count_circles.jpg" alt="" width="544" height="360" /></a>

以上这个据说是学前班同学更擅长的题目，微博上有人表示逻辑性强的头脑确实不能解出来，其实未必。我们试着用线性模型来解决这个问题：等式右边的数字一定是根据左边的数字来的，那么假设每个数字对右侧的贡献是有规律的，即右侧数字~第1位+第2位+...+第4位数字。最后注意这里的x实际上是因子，因为它只能有0~9总计10个水平。

训练数据文件train.csv如下：
<table width="320" border="0" cellspacing="0" cellpadding="0"><colgroup> <col span="5" width="64" /> </colgroup>
<tbody>
<tr>
<td width="64" height="19">one</td>
<td width="64">two</td>
<td width="64">three</td>
<td width="64">four</td>
<td width="64">answer</td>
</tr>
<tr>
<td align="right" height="19">8</td>
<td align="right">8</td>
<td align="right">0</td>
<td align="right">9</td>
<td align="right">6</td>
</tr>
<tr>
<td align="right" height="19">7</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">2</td>
<td align="right">1</td>
<td align="right">7</td>
<td align="right">2</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">6</td>
<td align="right">6</td>
<td align="right">6</td>
<td align="right">6</td>
<td align="right">4</td>
</tr>
<tr>
<td align="right" height="19">1</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">3</td>
<td align="right">2</td>
<td align="right">1</td>
<td align="right">3</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">7</td>
<td align="right">6</td>
<td align="right">6</td>
<td align="right">2</td>
<td align="right">2</td>
</tr>
<tr>
<td align="right" height="19">9</td>
<td align="right">3</td>
<td align="right">1</td>
<td align="right">3</td>
<td align="right">1</td>
</tr>
<tr>
<td align="right" height="19">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">4</td>
</tr>
<tr>
<td align="right" height="19">2</td>
<td align="right">2</td>
<td align="right">2</td>
<td align="right">2</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">5</td>
<td align="right">5</td>
<td align="right">5</td>
<td align="right">5</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">8</td>
<td align="right">1</td>
<td align="right">9</td>
<td align="right">3</td>
<td align="right">3</td>
</tr>
<tr>
<td align="right" height="19">8</td>
<td align="right">0</td>
<td align="right">9</td>
<td align="right">6</td>
<td align="right">5</td>
</tr>
<tr>
<td align="right" height="19">7</td>
<td align="right">7</td>
<td align="right">7</td>
<td align="right">7</td>
<td align="right">0</td>
</tr>
<tr>
<td align="right" height="19">9</td>
<td align="right">9</td>
<td align="right">9</td>
<td align="right">9</td>
<td align="right">4</td>
</tr>
<tr>
<td align="right" height="19">7</td>
<td align="right">7</td>
<td align="right">5</td>
<td align="right">6</td>
<td align="right">1</td>
</tr>
<tr>
<td align="right" height="19">6</td>
<td align="right">8</td>
<td align="right">5</td>
<td align="right">5</td>
<td align="right">3</td>
</tr>
<tr>
<td align="right" height="19">9</td>
<td align="right">8</td>
<td align="right">8</td>
<td align="right">1</td>
<td align="right">5</td>
</tr>
<tr>
<td align="right" height="19">5</td>
<td align="right">5</td>
<td align="right">3</td>
<td align="right">1</td>
<td align="right">0</td>
</tr>
</tbody>
</table>
线性模型的代码及说明如下：
<pre class="brush: r; gutter: true">## 读取训练数据
train &lt;- read.csv(file=&quot;D:\\Workplace\\train.csv&quot;)

## 把数据变为适用于线性模型的形式
freqTable &lt;- as.data.frame( t(apply(train[,1:4], 1, function(X) table(c(X, 0:9))-1)) )
names(freqTable) &lt;- c(&quot;zero&quot;,&quot;one&quot;,&quot;two&quot;,&quot;three&quot;,&quot;four&quot;,&quot;five&quot;,&quot;six&quot;,&quot;seven&quot;,&quot;eight&quot;,&quot;nine&quot;)
freqTable$y &lt;- train[,5]

## 用无截距的线性模型拟合之
myModel &lt;- lm(y ~ 0 + zero + one + two + three + four + five + six + seven + eight + nine, data=freqTable)

## 测试集相当于是2,8,5,1
test &lt;- data.frame(t(c(0,1,1,0,0,1,0,0,1,0)))
names(test) &lt;- c(&quot;zero&quot;,&quot;one&quot;,&quot;two&quot;,&quot;three&quot;,&quot;four&quot;,&quot;five&quot;,&quot;six&quot;,&quot;seven&quot;,&quot;eight&quot;,&quot;nine&quot;)
predict.lm(myModel,newdata=test)
# 1 --这只是行号
# 2 --这才是结果
# 警告信息： --无视警告
#   用秩缺乏拟合来进行预测的结果很可能不可靠

## 看看为什么这么准（训练数据没有4所以NA了）
round(myModel$coefficients)
# zero   one   two three  four  five   six seven eight  nine
# 1     0     0     0    NA     0     1     0     2     1</pre>

看到这里，是不是发现只用线性模型，就把这个数圈圈的秘密给训练出来了:-)
