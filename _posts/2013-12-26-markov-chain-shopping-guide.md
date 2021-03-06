---
layout: post
title: 马尔可夫链观点下的电商网站
date: 2013-12-26 12:26
comments: true
categories: 互联网
---
用户在电商网站内的页面流转是个显然的马尔科夫链状态转移过程，后者具有如下性质：


1.  有限个状态。
2.  给定当前，过去与未来无关。
3.  状态转移由状态转移概率矩阵决定。


用户在电商网站主要的页面状态包括：


*   首页
*   类目页
*   搜索页
*   宝贝页
*   店铺页
*   交易页（购物车、拍下页、订单页、付款页、退款页等）
*   营销页（主分会场、优惠券红包、专辑列表、商家活动等）
*   会员页（登录页、权益页、注册页、帮助页等）
*   子频道
*   流失页



在上面的假设下，用转移概率描述电商网站就很有意思：


1.   "成交后流失"和"未成交流失"是每个马尔科夫链的最终状态。
2.   可以认为多个用户（或抽象为多类用户）服从不同的转移概率矩阵。
3.   只有从宝贝页状态，才能到达下一步状态为交易页。
4.   从任何页都可以流失，而到流失页转移概率大的就是最薄弱环节。
5.   搜索以缩短链条长度的方式，增大从任何页到详情页的概率。
6.   推荐以延长链条长度的方式，增大从详情页到详情页的概率。
7.   导购路径的不同，就是转移概率矩阵的不同，引导成交比例就是状态转移概率。
8.   转移路径比例不再是简单的网站统计指标，而是网站优化的风向标。