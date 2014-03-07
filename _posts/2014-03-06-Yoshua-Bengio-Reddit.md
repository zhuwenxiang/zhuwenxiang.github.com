---
layout: post
title: 深度学习大牛Bengio教授在reddit吐槽
date: 2014-03-07 14:20
comments: true
categories: 
    - 统计建模
---

Deep Learning学术界的三架马车，目前[Geoffrey Hinton](https://www.cs.toronto.edu/~hinton/‎)已被Google 收编，[Yann LeCun](http://yann.lecun.com/)已被Facebook收编，还留在学术界的[Yoshua Bengio](http://www.iro.umontreal.ca/~bengioy/yoshua_en/index.html)最近心情好，在[reddit](http://www.reddit.com/r/MachineLearning/comments/1ysry1/ama_yoshua_bengio/)上开帖定期回答问题。我抽取了一些有料的回答在下面，希望对大家了解这方面有帮助（再不上船可就晚了）。

* 最近掀起的深度学习浪潮，只能表明机器学习界浪费了很多年没去探索它，尤其1996-2006这十年。（吐槽深度学习大热）

* 学习好的表示(representations)是深度学习的核心目的，而非像SVM一样就是在特征的固定集合做一个线性预测。（吐槽SVM用kernel转移重点）

* 为什么决策树注定泛化能力差？我的[文章](http://www.iro.umontreal.ca/~lisa/pointeurs/bengio+al-decisiontrees-2010.pdf)中曾说明，其关键点是决策树（和许多其他机器学习算法）划分输入空间，然后给每个区域分配不同的参数，因此没有推广到新区域或跨区域的办法。不可能学习到一个需要跨越区域比训练样例数目还多的函数。相反神经网络可以做到非局部的泛化，是因为每个参数在许多区域被重新使用，在常规的神经网络通常是一半的输入空间。（吐槽决策树泛化能力差）

* 无监督的处理过程（和预处理）仍然是处理半监督和转移学习（领域适应及非平稳数据）问题的关键成分, 尤其新出现类别的标记样本很少（或分布改变）的时候。我们就是这么赢得ICML2011的[比赛](http://www.causality.inf.ethz.ch/unsupervised-learning.php)。 

*    无监督学习(unsupervised learning)的未来更吸引人的原因

     1. 利用未标记数据的庞大数量的优势
     2. 了解所有观察变量间的统计依赖关系，因此可以回答给定任何变量子集下关于任何子集的新问题（训练集中未见的）
     3. 是非常强大的正则化，可以帮助学习者理清变化的潜在因素，使得更容易从极少数的例子解决新任务。
     4. 可用于在受监督情况下输出变量（待预测的）是一个非常高维的复合物（如图像或语句）的场合，即所谓的结构化输出。 

* 超参数与在训练中学习到的参数不同，因为后者通常是通过试错手动设置的，或是对所有参数值组合做愚蠢的大范围探索。（吐槽grid search傻大粗）


*   问：目前深度学习取得成功的问题都是人类保持最先进水平(state-of-the-art)的问题，如图像和语音识别、自然语言处理(vision/audio/language)，有没有胜过人类的案例？
 
    答：在欺诈识别以及Netflix的[推荐系统](http://techblog.netflix.com/2014/02/distributed-neural-networks-with-gpus.html)中有成功的案例，特别是当输入变量巨大到无法可视化或人类可以消化的时候。尽管我没具体比较机器和人脑的性能，但纯粹的速度优势，也不会考虑让人类做这些工作。

* 在一天结束时，只有数据。专业的知识也是从过去的经验来的：要么通过与人的交流传达（最近的人，或过去的几代人，即所谓文化进化），要么通过遗传进化（这也依赖于如何将知识刻入基因的经验）。潜在说明我们可能需要多种优化方法，而不仅仅基于梯度下降（比如大多数的学习算法）。（谈谈大数据，不明觉厉）

* 我相信大脑的大部分工作是尽量把我们的经验变得一致(coherence), 以建立一个关于世界的更好模型。

关于深度学习的革命性再怎么强调都不为过。除了在现有的图像语音识别中不断刷新state-of-the-art之外，在Google, 使用深度学习的AI给机器随机“看”了1000万个Youtube视频。你猜它看到了什么？猫的脸！在百度，使用深度学习的广告CTR预估模型用kilo数量级特征战胜了原来billion数量级特征的线性模型。