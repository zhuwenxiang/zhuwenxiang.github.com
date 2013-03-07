---
layout: post
title: shell中一个日期计算trick
date: 2011-09-21 10:06
comments: true
categories: []
---
<pre class="brush: shell; gutter: true">#获取今天为出发点，num_day天之前的6位数字日期（如110823）

begin_date=`date -d "$CURRENT_DAY -${num_day} day" '+%y%m%d' `

#获取end_date这天为出发点， num_day天之前的6位数字日期

begin_date=`date --date="$end_date $num_day days ago" +%y%m%d`</pre>
<p align="left"></p>
