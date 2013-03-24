---
layout: post
title: 基于线性模型对奥运金牌数的预测
date: 2011-12-12 12:41
comments: true
categories: 统计建模
---
为什么往往反而是最简单的线性模型会比复杂精巧的模型有更好效果，其实不外乎因变量除了主要自变量之外会有大量微小的因素所影响，以至于剩下的不能由自变量所解释的误差恰好已足够构成正态分布这个原因。

我当时是从下面的例子（来自我的导师Prof. Yang和师兄Dr. Zhang）体会到线性模型的威力的。我们都知道，在世界杯或者奥运会上作为东道主，都具有一定的主场优势，球队成绩或者代表队的金牌数可以较上届有所提高。那么如果我们要衡量东道主地位究竟能给成绩带来多大提升，仅仅用线性模型（或者稍作改进的线性模型）居然就可以做得很好。为了预测2008年奥运会中国代表队能得到多少块金牌，我们收集到的数据如下：
<table width="554" border="1" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">届别</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">时间</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">举办地点</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">东道主本届金牌数</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">东道主上届金牌数</p>
</td>
<td valign="top" nowrap="nowrap" width="110">
<p align="left">NA备注</p>
</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第1届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1896</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">希腊·雅典</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">10</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="110">
<p align="left">没有上届比赛</p>
</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第2届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1900</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">法国·巴黎</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">26</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">5</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第3届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1904</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">美国·圣路易斯</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">70</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">20</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第4届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1908</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">英国·伦敦</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">56</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">1</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第5届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1912</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">瑞典·斯德哥尔摩</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">24</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">8</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第6届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1916</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">德国·柏林</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="110">
<p align="left">因第一次世界大战停办</p>
</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第7届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1920</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">比利时·安特卫普</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">13</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">2</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第8届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1924</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">法国·巴黎</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">13</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">9</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第9届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1928</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">荷兰·阿姆斯特丹</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">6</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">4</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第10届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1932</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">美国·洛杉矶</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">41</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">22</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第11届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1936</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">德国·柏林</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">33</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">4</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第12届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1940</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">先日本·东京，后芬兰·赫尔辛基</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="110">
<p align="left">因第二次世界大战停办</p>
</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第13届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1944</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">英国·伦敦</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="110">
<p align="left">因第二次世界大战停办</p>
</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第14届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1948</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">英国·伦敦</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">3</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">4</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第15届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1952</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">芬兰·赫尔辛基</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">6</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">8</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第16届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1956</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">澳大利亚·墨尔本</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">13</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">6</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第17届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1960</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">意大利·罗马</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">13</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">8</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第18届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1964</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">日本·东京</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">16</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">4</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第19届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1968</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">墨西哥·墨西哥城</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">3</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">0</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第20届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1972</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">德国·慕尼黑</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">13</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">5</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第21届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1976</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">加拿大·蒙特利尔</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">0</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">0</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第22届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1980</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">苏联·莫斯科</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">80</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">49</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第23届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1984</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">美国·洛杉矶</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">NA</p>
</td>
<td valign="top" nowrap="nowrap" width="110">
<p align="left">美国拒绝参加上届</p>
</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第24届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1988</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">韩国·汉城（现称首尔）</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">12</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">6</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第25届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1992</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">西班牙·巴塞罗那</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">13</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">1</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第26届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">1996</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">美国·亚特兰大</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">44</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">37</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第27届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">2000</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">澳大利亚·悉尼</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">16</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">9</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第28届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">2004</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">希腊·雅典</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">6</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">1</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
<tr>
<td valign="top" nowrap="nowrap" width="54">
<p align="left">第29届</p>
</td>
<td valign="top" nowrap="nowrap" width="36">
<p align="left">2008</p>
</td>
<td valign="top" nowrap="nowrap" width="148">
<p align="left">中国·北京</p>
</td>
<td valign="top" nowrap="nowrap" width="108">
<p align="left">需要预测金牌数</p>
</td>
<td valign="top" nowrap="nowrap" width="98">
<p align="left">32</p>
</td>
<td valign="top" nowrap="nowrap" width="110"></td>
</tr>
</tbody>
</table>
<p align="left">事先删除某些离群值，然后基于均值建模，得到的回归方程是：</p>
<p align="left">东道主本届金牌数=5.8+1.35×上届金牌数</p>
<p align="left">这个方程预测金牌数为49枚。如果反感手动删除数据，可以使用中位数回归，即quantreg包中rq()函数，然后基于中位数建模，得到的回归方程是：</p>
<p align="left">东道主本届金牌数=3.65+1.56×上届金牌数</p>
<p align="left">这个方程预测金牌数为53-54枚。而实际上在2008年奥运结束的前一晚，中国队的金牌总数才刚好达到49枚。因为男子跳台丢了金牌，所以悬念留到最后1天，最终中国队的金牌数字是51。当然这个只是给了一个很粗略的估计，但似乎已经比当时所有来自专家的预测都靠谱多了。可见只要变量选得好，线性模型的预测效力是很靠谱的。而从下图可以看出，其实得出这个预测结论并非如想像中那么显然。</p>
<p align="left"><a href=""><img class="alignleft size-full wp-image-348" title="lm" src="http://e.hiphotos.baidu.com/album/s%3D550%3Bq%3D90%3Bc%3Dxiangce%2C100%2C100/sign=5ae62bd791529822013339c6e7f10af6/08f790529822720e1036f5ea7acb0a46f21fab21.jpg?referer=e73790319213b07ee4aa643815ff&x=.jpg" alt="" width="529" height="398" /></a></p>
