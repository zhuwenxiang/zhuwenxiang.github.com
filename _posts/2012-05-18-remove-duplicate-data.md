---
layout: post
title: 几个数据去重的办法
date: 2012-05-18 15:12
comments: true
categories: awk
---
<pre>
对数据集的行去重很容易用uniq -c解决，或者awk '!x[$0]++' file就可以。但在从不同数据源取出特征并试图合并数据集时，经常会发现某个列重复了好几次，指定列来删除很不优雅，这时可以用下面几种办法。比如合并后的数据集形式是uid+特征+uid+特征+…文件名是file，文件内容如下

uid1 f1 f2 f3 uid1 g1 g2
uid2 f1 f2 f3 uid2 g1 g2
uid3 f1 f2 f3 uid3 g1 g2
uid4 f1 f2 f3 uid4 g1 g2

目标是删除每一行内与第一列字符重复的字符，以达到以下效果

uid1 f1 f2 f3 g1 g2
uid2 f1 f2 f3 g1 g2
uid3 f1 f2 f3 g1 g2
uid4 f1 f2 f3 g1 g2

shell方案：cat file|while read uid left;do echo "$uid ${left// $uid}";done 
while读取变量时最后一个变量则代表剩下全部字符串（注意IFS指定分隔符）， $uid是第一个字符串，$left则是剩下所有。然后再对 $left中的含有 $uid 的进行全部替换为空。

awk方案：awk '{uid=$1;gsub(" ?"uid,"");print uid""$0}' file
利用gsub函数替换，注意问号正则左边有空格表明它非首列。

sed方案：sed ':uid;s/^\(....\)\(....*\)\1/\1\2/;tuid' file 
利用标签功能来完成替换，注意正则表达式需针对具体情况更改。
据在2M行的数据测算上还是shell最快(30s),awk/sed时间大约是前者的1.5倍。</pre>
