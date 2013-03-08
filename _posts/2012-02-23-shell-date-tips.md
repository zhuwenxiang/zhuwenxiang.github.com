---
layout: post
title: shell日期计算几点tips
date: 2012-02-23 20:14
comments: true
categories: []
---
<strong>1. 如何计算 20120201前(或后)第30天（周\月\年）是哪天（周几）？</strong>

date -d "110201 30 days" +%y%m%d

date -d "110201 30 days ago" +%y%m%d

[解析] 系统支持，没啥好说的。几种变式如ago是向前，days可以换成months\weeks\years等，%w可返回是星期几。yymmdd格式便于排序比较，对海量日期数据处理的时候非常有好处。

<strong>2. 如何计算 20120201 - 201200301 之间有多少天？</strong>

date -f &lt;(seq 120201 120301) +%F  2&gt;/dev/null  | wc -l

[解析]  -f 参数从文件中读取每一行给 date 作为 +%F 日期输出，如果是错误的日期当然就会报错，这里屏蔽掉错误信息。能输出的就是可用的日期，然后记数。

<strong>3. 如何计算 20120201 - 20120301 之间有多少个工作日？</strong>

date -f &lt;(seq -f"%.f" 120201 120301) +%u 2&gt;/dev/null | grep [1-5] | wc -l

[解析]  同样只输入星期几，然后用 grep 过滤到6和7，再记数。
