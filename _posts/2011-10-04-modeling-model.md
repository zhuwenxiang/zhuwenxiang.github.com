---
layout: post
title: 标准建模流程(3): 模型选择
date: 2011-10-04 14:59
comments: true
categories: []
---
<p align="left">由于训练数据既包含输入-输出之间的规律，也包含噪声，所以建模时会同时匹配出上述两种情况，如果模型太复杂，就会将噪声也包含在其中。好的模型足够对输入-输出之间的规律建模，又不够对噪声建模（当然，前提是噪声较信号为弱）。首先定义两个名词：</p>
<p align="left"><strong>训练误差</strong>：是在训练样本上的平均损失，亦称经验风险。</p>
<p align="left"><strong>测试误差</strong>：是在与训练数据独立同分布的测试数据上的平均损失，亦称期望风险；</p>
<p align="left">估计不同模型的性能，选择出能使测试误差最小的模型m，这个过程就是所谓模型选择。但测试误差通常是很难提前计算的（比如预测问题），因此主要方法就是用训练误差去估计，而训练误差是测试误差的欠估计（有偏）。因此在模型选择复杂度时，存在偏差-方差的平衡，也就是说要预防过拟合的出现。</p>
<p align="left"><a href="http://www.zhuwenxiang.com/wp-content/uploads/2011/10/model_select.gif"><img class="alignleft size-full wp-image-302" title="model_select" src="http://www.zhuwenxiang.com/wp-content/uploads/2011/10/model_select.gif" alt="" width="566" height="435" /></a><br clear="ALL" /> 在所谓的模型选择中，有时候指的是选择模型类别\cheta，如所有2个高斯分布的混合模型与所有3个高斯分布的混合模型。有时也指在某类别模型中的一员，比如高斯分布的参数\theta的值为{\miu,\sigma}，就是说类别是固定时考虑的是不同的参数值。在实际应用中，必须同时考虑上述两种情况，也就是说模型空间M={cheta,theta}。</p>
<p align="left">单模型选择讨论参数\theta，我们的应用比如在时间序列分析中根据AIC来确定对某个序列拟合ARIMA模型中(p,d,q)这三个参数；多模型选择讨论参数\theta，我们的应用比如在投票模型中根据方差倒数来确定模型的权重。最后，在模型选择方面应注意遵守以下原则：</p>
<p align="left"><strong>简约性</strong>：奥卡姆原则，如非必要，勿增实体；</p>
<p align="left"><strong>稳定性</strong>：比如输入稍微不同时，输出的差别应在可接受的范围内；</p>
<p align="left"><strong>可识别性</strong>：模型参数的估计唯一，没有模棱两可的模型；</p>
<p align="left"><strong>理论一致性</strong>：模型参数应该与理论或者常识一致，避免公式正确但结论荒谬，比如得到某些不可能为负的预测值（应用上，如时间序列模型预测消费时会弃掉负值）；</p>
<p align="left"><strong>拟合优度高</strong>：理解为模型在训练集上的表现，但这不是必要的。</p>
<p align="left"><strong>预测效力高</strong>：即模型在测试集上的表现，这是衡量模型最重要的标准。</p>
