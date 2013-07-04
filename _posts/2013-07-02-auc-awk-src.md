---
layout: post
title: 理解AUC的意义
date: 2013-07-02 1:03
comments: true
categories: awk
---
###ROC曲线
分类器的评价与分类器本身同样重要。把分类器的性能映射到ROC(Receiver Operating Characteristic)空间，是一种常用的评价分类器的方法。ROC曲线横轴是FPR（False Positive Rate 假阳性率，即判断为正例但实际为负例的比例），纵轴是TPR（True Positive Rate 真阳性率，即判断为正例且实际为正例的个数占全部正例的比例）。ROC曲线只对二分类问题有效。而尤其当正负样本不平衡时，这种评价比起准确率更有效（只要想想把垃圾邮件分类器如果把所有邮件都识别为不是垃圾邮件，也可以得到90%以上的准确率，但这没有任何意义）。

###AUC的几何意义
AUC(Area Under Curves)指的是ROC曲线下的面积，该指标能较好的概括不平衡样本分类器的性能而成为很多数据挖掘竞赛的判定标准。由于仅有有限个样本，无论训练样本还是测试样本，因此无法获得最精确的ROC曲线，从而无法精确计算AUC。在实际计算中，使用类似微积分的方法，用梯形面积的和去近似。

###AUC的物理意义
假设分类器的输出是样本属于正类的socre（置信度），则AUC的物理意义为，任取一对（正、负）样本，正样本的score大于负样本的score的概率。从而我们能够理解对于AUC而言，并不关心具体预测的结果是标签或者概率，也不需要卡什么阈值，只要在预测结果之间有排序即可。

###如何计算AUC
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

