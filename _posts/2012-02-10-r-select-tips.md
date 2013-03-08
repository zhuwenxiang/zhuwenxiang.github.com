---
layout: post
title: R根据行列从df中选择
date: 2012-02-10 19:05
comments: true
categories: []
---
dataframe应该是R中最常见的复合数据格式之一，有很多选择数据框中的数据的办法，但是要注意的是不同的选取操作返回的数据类型是不一样的。熟悉以下简单几例就可以避免很多无谓的转换操作：

Df[1,] 选择第1行=&gt;得到dataframe类型（支持dim函数查看维数）

Df[,1] 选择第1列 =&gt;得到vector类型（不支持dim函数，可用length查看长度）

Df[,c(1,4)]选择第1和4列=&gt;得到dataframe类型（奇怪吧？）

Df[1]选择第1列=&gt;得到dataframe类型

Df[[1]] 选择第1列=&gt;得到vector类型

注：在第2个例子里使用参数drop=FALSE就可以强制R将返回的结果转换成数据框。
