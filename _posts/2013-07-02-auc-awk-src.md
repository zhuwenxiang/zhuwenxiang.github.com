---
layout: post
title: 对auc的理解与awk脚本实现
date: 2013-07-02 1:03
comments: true
categories: awk
---

auc是roc曲线下面积，roc的横轴是false positive rate（假阳性率，即判断为阳性但实际为阴性的比例），纵轴是true positive rate（真阳性率，即判断为阳性且为真阳性的个数占全部真阳性的比例），auc较好的概括准确率和召回率因此成为很多数据挖掘竞赛的判定标准，不过只对二分类问题有意义。

给定测试数据test.dat
>0.9 1<br>
0.8 1<br>
0.7 0<br>
0.6 1<br>
0.55 1<br>
0.54 1<br>
0.53 0<br>
0.52 0<br>
0.51 1<br>
0.505 0<br>

auc.awk 代码如下：
<pre class="brush: bash; gutter: true">
#!/usr/bin/awk -f
#./auc.awk <(sort -nk2 real_prob.csv )

BEGIN {
        FS = OFS = &quot;\t&quot;;
        pos_label = 1;
        x0 = x = y0 = y = 0;
        auc = 0;
}
{
        label = $2;
        if(label == pos_label) 
            y++;
        else 
            x++;
        auc+=(x-x0)*(y+y0);
        x0 = x;
        y0 = y;
}
END {
    auc+=(x-x0)*(y+y0);
    auc/=2*x*y;
    print auc;
}
</pre>

cat test.dat |./auc.awk 结果是0.75，正确。

