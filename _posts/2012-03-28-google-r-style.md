---
layout: post
title: Google的R编码规范
date: 2012-03-28 01:36
comments: true
categories: R
---
目前R语言在工业界用于统计模型的Demo研发可能更多一些，但也应逐渐吸取工程方面的优点，遵循风格一致的原则。清晰易懂的代码，有利于让读者（包括6个月后的我们自己）集中精力到所写代码的涵义，而不是去识别代码是怎样写就的。据该编码规范猜测，Google内部应该也有许多人也使用R，甚至其举例函数用的都是PredictCTR()，搜索引擎公司应该都知道CTR预估有怎样的意义。这里给出Google的编码规范供大家参考，如能严格遵守有利于R在企业内部的交流推广。概括一下该规范的内容包括:

1． 命名：文件、变量、函数命名规则遵循file_name.R、var.welldefine、MyFun()等；

2． 格式：每行80字符，赋值不用=，缩进空两格，二次运算符两端空格，逗号后空格等；

3． 组织：包括作者、最后更新时间、版权信息、输入输出、函数定义、使用扩展包说明等。

全文链接在：<a href="http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html">http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html</a>
