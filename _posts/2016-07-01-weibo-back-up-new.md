---
layout: post
title: 微博小结 2014~2016
date: 2016-07-01 15:12
comments: true
categories: 生活
---
博客已经一年半没更新了，把微博全删除了，搬来来这里凑个数。除了按照以前分为四类：技术、时评、互联网和生活之外，增加两个分类是书影音、足球。

## 技术

推翻假设是科技进步的重要动力。数学史上的典型例子是非欧几何诞生于否定第五公设，物理学19世纪末两朵乌云的故事也很有说服力，当然统计学里有大块专门讲从数据到结论正确与否的假设检验。生物里面的进化论假说和地理里面的大陆漂移假说算是比较靠谱的，而最不靠谱的应该是经济学的理性人假说吧。

线性代数主要讲矩阵，矩阵就是线性变换，也就是把直线变成直线的几何变换，包括过原点的旋转、镜射、伸缩、推移及其组合。特征向量是对一个线性变换很特殊的向量：只有他们在此变换下可保持方向不变，而对应的特征值就是该向量缩放的比例，最大特征值就意味着在该方向上缩放比例能达到最大。

在此基础上再来理解PCA降维：样本协方差阵是变量间的相关性度量，在高斯假设下它是协方差的充分统计量，根据对称阵可正交分解，它的最大特征值所对应特征向量的方向，就是对数据正交变换后缩放比例最大的方向，这意味着该方向上信噪比最大，如此就使该数据的第一大方差落在第一个坐标上，依次类推。

进而PCA降维的适用范围就很明显：线性假设意味着变量量纲不同时要非常小心，反过来也说明为啥图像识别该方法甚为有效；高斯假设意味着当样本不符合指数族分布时就是白忙活，因为样本协方差阵实际上只使用了均值和方差，对指数族分布这才是充分统计量；主成分正交和信噪比很大是普遍假设，就不说了。

论文的作用就是总结自己一段时间的工作，至于最后的结果如何反而不用特别在乎。而且我发现无论什么东西都是这样，想想不清楚，说说不清楚，写写就清楚了。

统计发源于赌博真不是没来由的。经常发现和合作的同事们解释统计模型背后的原理时，用掷骰子来举例既合适又容易说明白。比如要问概率和统计的区别是什么，知道骰子来猜点数就是概率问题，反过来当知道点数而猜骰子，那就是就是统计了。特别是对生成模型，掷骰子的解释往往深刻而容易理解。

贝索斯谈推荐：我们能做的就是利用技术来加快找书速度。比如你今天走进一家书店，发现一本让你灵魂出窍的书的可能性是1/1000，利用技术了解你本人以后，使其增加到1/300，然后是1/100，再经几年努力使其达到1/50。这将创造巨大的价值，再伟大的商人也无法逐个了解其顾客，而电子商务使这成为可能。

在知识爆炸的年代，知识管理是个重要技能，推荐几个我常用的工具。记笔记的有onenote格式丰富结构清晰，evernote终端支持好网页剪辑强；记文件的有百度云容量大可以在线播放视频，dropbox与本地文件集成好稳定性高；记邮件有outlook版面优美可离线，gmail搜索功能强邮件分类准。

今天最有心得的收获：算法应当是为产品服务的，而不是相反。好的算法建立在直接满足用户核心需求的产品之上。

社交网络中好友推荐的经典方法FOF(Friend of Friend)用共同好友数来衡量用户接受推荐的可能性。但其实并不是俩人共同好友越多就越适合推荐，特别当某个推荐结果的共同好友数很高以至于成为推荐列表中的outlier时，推荐系统就该想想为什么他们有那么多共同好友却不是好友了。

机器学习问题往往最终被转化成对某个目标的最优化，但机器学习和最优化最大的不同在于，机器学习根本不关心精度。比如随机梯度下降在收敛到一定范围后，即使再迭代很多次也难以提高精度，但这不仅无害甚至有利。因为高精度算法实际上会不断拟合训练集包括噪声的细节，而这对其泛化能力没有任何贡献。

国航航班上的广告除了各种豪车名茶之外，还有IBM的智慧地球系列，维持水族馆的生态系统，乳酪原产地奶源追踪，葡萄酒口味推荐等等，跟纽约警察局犯罪预报，芝加哥动物园门票的精细化运营一样，一如既往的高大上且需求莫名其妙。

作为技术人员，最好的工作状态也许是：既不离开业务的水源干涸而亡，也不被业务的洪水淹没至死。

好的开源项目往往不是凭空诞生，而是真正为了解决自己必须面对的问题造出的轮子。不论你面对问题的难易，答案是几行脚本还是复杂的系统，只要能解决自己的问题，就是大家需要的好轮子。正所谓民族的就是世界的，艺术如此，技术同样如此。

kaggle越来越娱乐化了, no fun no leaderboard. 随便举几个: "I don't think anybody has overfitted as much as I have"(我想没人比我更过拟合了队), "Tap here to win a million dollars"(点我赢百万队), "stochastic leaderboard descent"(排名随机下降队), 最牛的"I know nothing about CTR"...

关于复杂网络社团挖掘和聚类的区别：复杂网络是基于拓扑结构的，a点和b点不是因为距离而是因为联系被分在一起；而聚类是以点的距离为核心出发点的概念，两两之间必有一个距离，然后才是类内距离一定小于类外距离。请懂的人指教。丛聚类角度，社区发现其实是需要做graph embedding的，即将网络嵌入到一个距离空间中，然后聚类；从复杂网络分析的角度，则不同，主要是分析网络结构的规则性（ structural regularity， e.g, modularity, infomap）或者网络连边的生成机制（generative model, e.g., blockmodel, mixture model）。

公鸡叫了之后天亮了。会产生两种后果：一是公鸡以为天是它叫亮的；二是猪会认为，只要把公鸡杀了，天就永远不会亮了。<一九八四>里面的这则故事，其实是为了说明把相关关系错误当成因果关系的坏处。

以前我总是觉得内部PK是大公司典型的内耗现象，只要事情稍有前景，通常总有两个甚至更多团队来争着做，或许还会面临残酷的分桶测试。后来我渐渐理解，在本来就是赢者通吃的丛林社会，大公司只有通过内部PK这种方式，才能有效的把市场环境的压力传导进来，从而找到那只放出去也够凶猛的野兽。

校招新同学问，好像有不少团队在做同样的方向啊，很奇怪。其实一点都不奇怪，高管都不傻，大公司的内部pk为什么是常见而合理的？在一个体量很大的平台上，从95分到99分的提升是值得做的，因为与把事情做到极致而带来的价值提升相比，内部pk所多出来的人力成本简直可以忽略不计，最典型的非微信莫属了。

对于互联网用户，在Android和iOS之间的差异之大，可能比PC和mobile之间的差异还要大。并不仅是默认删除是长按还是右滑的差别，而是两种系统背后所代表着的，从购买力到思维方式，甚至到价值观的差别。你倒是给我说说iOS的价值观是什么。

经常一起购买的商品,购买此商品的顾客也同时购买,看过此商品后顾客买的其它商品,根据您的浏览历史记录推荐商品,与该宝贝同时购买的,买了该宝贝的人还看了,买了该宝贝的人还买了,根据你浏览的宝贝推荐,你可能喜欢,大家正在买,看了此商品的会员通常还看了,买了此商品的会员通常还买了...表达不能啊...

LR产出的 predict score 当作后续GBDT的特征，是很好的模型融合“现货”方法。因为LR的训练速度快，所以数据吞吐量大，就可以把GBDT限于训练速度而覆盖不到的时间段的信息也纳入进来。

Personalized pricing 明令禁止，Personalized discount 却普遍存在，这简直是现代社会的掩耳盗铃。

抛砖请教下处理position bias方法 1. 用lr模型，将其作为特征在训练时使用，预测时不用（相当于固定position）并且注意所有交叉特征没有position特征参与。2. 用tree模型, 改变样本的分布，将每次click归一化到首位上去（如第二位的click值相当于2.5个首位click）当然归一化系数需要满足某概率分布。

学术界的目标是证明自己（哪怕仅仅某方面）比别人更聪明，所以学术界只认第一不认第二，谁先发表成果就只是谁的, winner takes all. 但工业界不是这样，聪明并无特别意义，你需要通过合作向顾客（很多时候也是老板）提供有价值的服务，只要能提供价值，就算笨一点也没关系，第二三四类选手统统有机会。

recsys2015 针对shared accounts的top-N推荐，虽然作者实际应用在雅虎音乐中，但slides里的例子都是购物。娱乐或者购物网站的家庭账号是实际存在的，如何识别子账号和针对子账号做出对应推荐的变化都是新课题。

recsys2015 沉闷的意大利人带来关于persuasive technology 的keynote, 据说在销售、外交、政治、宗教、军事训练、公众健康、管理中有广泛的应用，第一次听说这技术，相见恨晚！

recsys2015 interactive rs 精髓在于产品设计能够 meeting the user’expectation & understanding user’s need. 然后Netflix就介绍了他们设计用来和用户交互的两种游戏：Max rating game 和 hot or cold game. 

我听完的感觉是大牛往往是牛在细节：因为会议在上海举办，这个keynote里几乎所有举的例子，无论人物电影音乐软件都是经过本地化处理的，包括张艺谋巩俐陈凯歌周杰伦QQ音乐等等，理解起来没有文化上的困难。噢，还提了好几次Jack Ma…就那个alibaba的首富。

统计学里面，我们管这个叫做幸存者偏差：首先她得是你的粉丝，所以也许她和你志趣相投，那方面比较开放；其次她得有个什么事，才会给你写私信，如果不是她出轨或者被出轨我想不出那得是什么事。

“要深谙此道必须先理解人们，包括他们的口味、兴趣、关系、需要，甚至是生活目标等。也需要理解内容，知道帖子或者评论在讲些什么，图片和视频包含什么内容。只有这样，才能把最相关的内容筛选出来并呈现在用户面前。” Deep Learning 在 Facebook 主要用于解决信息过载（个性化推荐）的问题。

我认为在推荐里面用户画像绝对不是必须，有更多比用户画像好的手段来达到目的，简单的求兴趣向量，复杂的搞个trigger learning. 除非两点，你实在没别的数据了，或者你根本是情感类产品，目标是趣味不是效果，“我是小萝莉最爱的高富帅”。

很有启发性，可惜内容质量和用户个性化如何balance, 如何使用社交数据, 如何多样和惊喜等真正“推荐”的部分说得太少。此外在计算user profile等基于内容推荐的场合，batch到streaming的切换是基本无损的，但是在需要计算item similarity等基于协同推荐的场合，这种切换有时会损失很多信息。

"我们所做的几乎所有事情都与推荐有关。上周我曾造访过eBay，他们告诉我说，90%的用户购物活动都来自于搜索；而我们则恰恰相反。推荐是很重要的，而搜索功能只有在我们无法向用户推荐他们想看的内容时才会发挥作用。" C2C模式更适合搜索，B2C模式才需要推荐，也许这是ebay和amazon需求的本质不同。

## 时评

今天的上海隔夜同业拆借利率（Shibor）一度飙到13.44%，这是个什么概念？民间高利贷月利息普遍是1分5厘，年化后相当于18%左右。也就是说银行间的隔夜拆借，借出了高利贷的水平，多高的利益就对应多大的风险，想想高利贷都是借给什么样的人。央行接着印钞票，我准备投资鸡蛋，10块钱一个妥妥的。

前事不忘后事之师。2008年9月16日，伦敦隔夜同业拆放利率（美元Libor）曾达到6.43%，也只是翻番而已。当时的大事是，雷曼宣布破产，美林被收购，AIG被政府接管，此后是漫长的次贷危机。这个市场风险管理系统的核心指标，影响几乎所有的金融衍生品的估值引擎。当然国情或许不同，仍然建议大家多买鸡蛋。

从2004年到2010年，小肥羊的直营店从16家增加到240家，其中并购加盟店功不可没。小肥羊收购加盟店时，给每家店三倍市盈率和一半的装修款，如果对方不卖，就取缔对方到期后的加盟权。后来小肥羊卖给百胜时，得到了35倍的市盈率。同样也是这个人才，在三聚氰胺事件后还把蒙牛卖给了中粮。

只要就业人口不减少，政府有一百个办法躺着就能让房价上涨。多开几台印钞机，减少土地供给，放宽限贷限购，出规划画大饼，最不济还可以改改行政区划，乡变镇县改区什么的。刚好他也有这个动机：不卖地，八千万同志的工资津贴购物卡你来发啊，菜总你说是吧。@菜场经济学

楚王好细腰，宫中多饿死。政府老大喜欢足球，房地产开发商就来买单。从广州恒大下血本搞定亚冠，到上海绿地砸重金拿下申花，目前的16支中超球队已经无一例外具有了房地产开发商的背景，还有广州富力、杭州绿城、天津泰达、河南建业……光听听这些球队的名字吧，土豪土豪，没有土地哪有豪情。

公开数据显示：2012年16家A股上市银行净利润总额10269亿元，全部2469家A股上市公司净利润总额19544亿元，银行占52.54%；2013年上半年16家A股上市银行净利润总额6191亿元，全部2467家A股上市公司净利润总额11392亿元，银行占54.35%。如此暴利吸血的银行，居然好意思派个傻逼出来说余额宝压榨实业！？

如果看准了某个行业只是出现周期性的起伏，那么当行业整体表现得不景气的时候，反而是对该行业当中领头羊最好的买入机会。正因为他的产品竞争力更强，所以可以用最低的成本势如破竹的获得行业中弱势群体占有的那部分份额。投资有风险，现在是收割地产领头羊的好机会，收益将超过货币基金毫无悬念。

上班路上和出租车司机聊天，打听最近几天用快的打车到淘宝城，怎么都没有司机愿意接单了。司机吐露的真相是，余杭运管专门派了辆车在淘宝城门口监督，非余杭的出租车不准在淘宝城门口排队等客，以至于后者一般只能空车驶回。两个感概，余杭区和主城区的差别真的是方方面面的，地方保护主义真厉害！

恒大保利大规模回购，万科B转H获证监会核准，来自公司本身的利好哪怕再直接，地产股照样阴跌不止。央行释放流动性，总理报告未提房价，来自政府的利好哪怕很间接，地产股立马飞奔朝上。所以是房地产企业，还是房地产政府？@菜场经济学家

石英表取代机械表，数码相机取代胶卷相机，半导体存储取代磁带光盘，电力机车取代内燃机车，电动汽车取代传统汽车，机械的电子化是大势，便宜量又足——特斯拉涨的合情合理。不过所谓的汽车直销绕过4S店，不就是戴尔电脑直销绕过经销商的翻版么，为毛摇身一变又成了互联网思维攻占汽车行业了。

杨澜和吴征，王力宏和李云迪，凤姐和台湾籍统计博士生，刘强东和章泽天，哥伦比亚大学真是谈恋爱的好地方。

"一九六二年货币流通量达到一百三十亿元，而社会流通量只要七十亿元，另外六十亿元怎么办？就是搞了几种高价商品，一下子收回六十亿元，市场物价就稳定了"。（《陈云文选》第3卷，人民出版社1995年版，第377页）劫富济贫的高价商品，是以前的伊拉克蜜枣，现在的京沪商品房。能毕业了吗 @菜场经济学家

"过去十年如果你没在京沪买房，你做什么都是白干了。过去十年如果你在沪深炒股，你做什么也是白干了。"是这么个回事吧？@菜场经济学家

户外广告路牌，路灯杆子悬挂，临街建筑外立面，交通指示牌背面，公交站台雨棚，出租车后车窗，走在路上眼球真的是被各种楼盘广告包圆了。上帝欲使房地产灭亡，必先使其疯狂？

"天下所有的有钱人都会终成眷属，天下所有的情人都是失散多年的兄妹。"美丽的爱情离不开公司董事长或京沪学区房。@菜场经济学家

农夫山泉对于恒大冰泉的反击性的广告长达三分钟，详细讲述十五年来怎样建筑专用铁路搬运长白山原始森林里的涌泉水。之后一分钟不到又是恒大冰泉“搬运的不是地表水”的攻击性广告。矿泉水打架，央视赚翻了。

“在爱尔兰人当中，甚至是鼎鼎大名的肯尼迪家庭，当年发迹也是缓慢的。第一代肯尼迪于1848年由爱尔兰抵美，直到去世，一直是个劳工。他儿子的努力有起色，家境转好，以至于能将第三代肯尼迪送去读大学。第三代肯尼迪就是约瑟夫·肯尼迪，后来成了大富翁，从而使得第四代的约翰·肯尼迪当上总统。”

“邓大人”…这个称呼还是蛮新鲜的，史实如此吗？

昆明。乌鲁木齐。广州。从来没想过，火车站和砍人紧紧联系在了一块儿。

几万人，不让你发出声音，你也就发不出一点声音，太可怕了。

也许就是各种辟谣（水污染以及摇号）造成的杭zhou市政府的信用破产，于是在大的社会事件上得到了一个不好的反馈。地方政府真的是需要有点执政智慧的，杭zhou什么都不带萧山余杭玩，反而垃圾焚烧发电这种事却记得你，也不怪当地老百姓和基层人员有不满的情绪了。

据说今年是房地产行业不景气，各地房价都跌成shi了，商业银行也是控制风险起见限制房贷。但是房地产股却涨势凶猛，金融街和金地集团先后被险资举牌而涨停，我自己在过年回来时入手了一点万科的股票，算上分红，单在这一支股票上居然已经浮盈37%了。买地不如举牌，买房不如买房地产股。@菜场经济学家

果然欠债的才是大爷。看到一则通告："民生银行上海分行针对福建周宁籍信用卡透支逾期客户实施优惠还款政策：只需要处理本金的80%，其余金额由民生银行信用卡部向总行申请减免。优惠时间截止到2014年6月末。"利息和滞纳金不要了不说，连本金都不要了。周宁钢贸商威武雄壮，居然能把银行给坑了。

"5月新增贷款创10年同期新高"，温的强刺激，强的温刺激，有区别吗？@财政学研究

央行已将定向降准的范围扩大至股份制银行，民生银行、兴业银行在列。——小步慢跑比大步流星，走得更稳更远。@财政学研究

看完了吴晓波的大败局1和2两部曲，感触最大的还是，在国内做生意如果跟地方政府不对付，还是不要做了。健力宝，科龙，华晨金杯这些曾经如雷贯耳的名字，基本上可以说是被地方政府的贪欲一手干掉的。最有意思的是，企业家都有名有姓，而地方政府在集体决策的掩护下，都是匿名的。

法定产假休息的时间越长，未婚未育女青年找工作就越困难。也许那位人大代表的出发点是好的，不过考虑到真实世界的经济规律，别千万别。

有没有觉得首都警方的情报工作也挺牛逼的，从薛蛮子嫖娼到郭美美赌博再到一众歌手编剧演员吸毒，无论民房公寓还是会所别墅一抓一个准。

为什么说本杰明·富兰克林像是穿越回来的人？他出身贫寒，家里有17个孩子，因此总共只上过三年学，却靠自学通晓了法文、意大利文、西班牙文和拉丁文。他从12岁开始给同父异母的哥哥当印刷学徒工，后来哥哥生意失败，他就靠自己办印刷厂并办报纸，在40多岁获得财务自由，之后全心投身科学和公众服务。他建立了费城第一个图书馆，北美第一支消防队，创办宾州大学，建立宾州医院。他是科学家，发现电荷守恒，用风筝接触闪电却没被电死还发明了避雷针。他是政治家，参与起草独立宣言和制定宪法，名列国父。他是外交家，为北美争取到法国支援，成功赢得独立战争。他没当过总统，但头像印在了美元上。

突然想起来，既然北京、上海、广州、天津、贵阳、杭州……越来越多的城市都加入到禁止外地牌照入城的行列，会不会以后"所有城市禁止外地牌照进入本市"然后发现汽车这玩意儿根本就没有存在的必要了……

广州和天津的车牌竞拍政策出台时间都比杭州早很多，三个城市的竞拍底价是同样的10000元。2014年8月的这次竞拍，广州最低成交价10000元，天津最低成交价10500元，杭州最低成交价22500元……看看别人家的市民素（zhi）质（shang），你大杭州只能说是人傻钱多速来。@新浪浙江 @杭州交通918

有个朋友打算到北京出差，因为从来没去过北方，就在朋友圈里咨询大家这个季节去北京应该怎么带衣服，还认真地截了北京当地天气和温度，为了给大家提建议作为参考……热心的朋友们当然没让人失望，回复她的人又多又快，但从第一个人开始到最后一个人，大家都只说了两个字：口罩。

发现作为殖民地的代表城市往往现在发展都很好，风景秀丽，经济发达，环境保护也不差。大的比如香港/澳门/上海，小一点比如青岛/大连/厦门。究竟是这些地方本就人文地理条件很好，殖民者只是选了好的，还是说和殖民者在当时的软硬件建设以及后来有渊源的投资有关，殖民者选了才会好？

美股大跌，A股大涨，中华民族伟大复兴已完成62%.

"大学生创业是新时代的上山下乡"。@财上海

一年的雾霾天数，北京有175天，杭州有209天，其实北京的空气质量比杭州还要好些。

最近虾米热榜完全被李荣浩刷屏了，很有周杰伦刚出道那会儿的感觉（只是眼睛更小）好奇心起就去查了一下：原来李荣浩2010年就发表了首张专辑，五年过后在<我是歌手>节目获得踢馆机会才开始走红，而且踢馆还失败了，一个这么牛的人都不急，你急什么？

袭击音乐厅和体育场，是对人类文明的挑战。

支持顺丰小哥维权，现在对快递行业缺乏应有的尊重。最近跟政府部门打交道，一会儿要这一会儿缺那个，老家来回寄身份证户口本乱七八糟证明全靠顺丰。如果没有这家公司提供可依赖的服务，普通人的办事成本不知道比现在要高多少，出一趟门飞机火车出租车酒店，给社会造成多大浪费。

一言不合就脱，英格兰脱欧公投成功，苏格兰就不愿意了，要脱英公投。投票脱欧后，“什么是欧盟”成为英国最火的搜索关键词哈哈… 大多数人才能决定的未来，越来越像那部叫做《蠢蛋进化论》的电影了。

翻墙去FB爱国跟被卖了还帮着数钱并没有什么不同。

白百合和王珞丹分不清楚的就我一个吗。

惠普裁员，惠普裁完西门子裁员，西门子裁完索尼裁员，索尼裁完摩托罗拉裁员，摩托罗拉裁完诺基亚裁员，诺基亚裁完IBM裁员，IBM裁完微软裁员。结论就是@财上海 所说的，外企不是家，屌丝们走，去国企！

CCTV4国际频道也是这种，三个大题目就是抗日反美打台湾，完全没有任何信息量，但是就能把24小时排的满满当当。

## 互联网

真正是魔鬼在细节：使用Chrome浏览器，正在浏览的选项卡是高亮的这很自然；但当鼠标滑过其他不是正在浏览的选项卡时，居然有一种拿着手电筒光照的效果！

生活中处处有商机，在飞机上提供Wifi上网服务也可以成为一门足以上市的大生意。

自 2008年12月9日以来，您一共阅读了 212,638 个条目。#再见Google Reader#

京东那么多真实购买的评论没能好好summary一下真是白瞎了，动不动几百上千条的，谁能看得过来啊。

如果做一个@梁斌penny 梁总的特色常用词汇总，里面一定有美军/美帝、同志/群众、厂长/老板、职工/工友、大表/词库、码农/个人问题、干活/rush等，浓厚鲜明的社会主义包吃包住包介绍对象的大厂风格。

淘宝网给我发邮件推广虾米音乐客户端；新浪微博移动端首屏推广淘系APP列表；看到搜狐视频自制剧《屌丝男士2》里面至少三处数字公司的植入广告。这是今天观察到的几件小事。前面的是已公布的事情了，最后这个让我觉得数字公司收购搜狗这事儿没准挺靠谱的。

数字公司的手机助手曾偷师于91手机助手，加上有强大的客户端产品群可以借力，目前在装机数分发数上完爆后者。按照第一名吃肉第二名喝汤的理论，这次收购简直是给竞争对手的股价背书，完全看不懂。我一直用百度手机助手（前身是百度应用），体验很好，速度快应用全还能增量更新省流量，可惜前途未卜。

团购网站现在出现了很有趣的品牌本地化现象。龙头老大美团和点评雄踞北上广，且仍在百度投放广告。其他二三线团购网站往往在某些特定的二三线城市占据优势。如糯米网在青岛厦门，拉手在苏锡常，窝窝团在开封新乡，满座网在义乌临平，QQ团购在深圳，是否能够说明团购终于到了排排坐分果果的收官阶段。

@杨幂 代言58同城尝试了现代、科幻、武侠三种场景，五个镜头换五件衣服加五种发型，基本上是女神本色演出；@姚晨 代言赶集网虽然是骑驴村姑，好歹是个长头发的姑娘，而且人最后拉驴瞬间也摇身一变成为OL；@谢娜 代言赶集网，直接扮演孙猴子，还多多多大大大，真想替她说一句：人艰不拆。


看来对最近的热门讨论有动作了。昨天QQ邮箱发来的：同时拥有多个发信昵称，你可以做到。朋友间的邮件往来，你喜欢更亲密的昵称。求职或工作邮件，正式的发信昵称显得更专业。在发信时选择不同的帐号及对应昵称，满足你不同场合的需要。

Appstore排行榜里来自微信的游戏战绩骄人啊。总共四个游戏全在第一页，成绩分别是冠军亚军第六名和第八名。绕了一大圈回到看家本领上去了，娱乐帝国名不虚传。

发现身边朋友们通过微信朋友圈来记录生活状态越来越多。从QQ空间到校内到开心到微博再到微信的演变，社交网络产品本身其实一直都没有本质区别，有区别的只是上面的人。所以是不是除去产品本身因素外，这种演变的根源在于每个人生活圈子的更新，毕竟更换社交网络产品是最容易的，与过去告别的方式。

电商网站买田置地自建物流，视频网站拍电影拍电视剧，旅游网站挖掘线路景点资源，还有阿里做金融，腾讯卖保险，百度放小贷，家家户户都想着开银行。线下的护城河才够宽，离钱近的生意才够好，看上去互联网公司就要脱离穷逼轻资产时代了。不过人家谷歌微软脸书也家大业大的，怎么都想不起来开银行呢。

微博衰落 1.信息流只剩下新闻新闻，各种新闻。热门微博已经没法看了，营销号段子号今天长这样的明星号。2.微博搜索“一生就这么一次，谈一场以结婚为目的的恋爱吧。不再因为任性而不肯低头，不再因为固执”看看僵尸粉是怎么帮浪浪刷活跃度的。3.坐地铁公交班车，发现身边的人更多的是在刷朋友圈。

微博衰落 1.微博的活跃度下降是不争事实，但也未必是坏事：僵尸粉少了，时间线没那么吵了。2.微博的核心价值在传播，速度和范围是朋友圈无法比拟的，微博去做好友圈是丢西瓜捡芝麻。3.传播是有向边，对1%生产内容的人看影响圈，对99%消费内容的人看关注圈，改善这个是关键，搞那么多花哨花边纯属浪费资源。

事实证明撒钱也是很有技术含量滴，阿里的经验更丰富些。第一，微信内置嘀嘀打车，快的打车内置支付宝，前者往重了做，20块只买了一个微信支付习惯（这年头谁没装微信），后者往轻了做，25块买俩应用安装。第二，知道打车的都是没得选的弱势群体（师傅回龙观去不去），结果阿里就把多出的5元给了司机！

过去这一年，股价变成二分之三，系数却变成三分之二，这不科学啊！（指的是2014.01的百度）

春晚前广告基本被互联网公司占领只是一个信号，现在是八点档电视剧前黄金广告时间也几乎全被占领。微信支付，手机百度，京东，苏宁，小米，最搞的是360手机卫士后紧跟的是腾讯手机管家。既然电视广告是往三四线扩张的不二手段，为何独独阿里缺席？

微博像体育馆，每逢足球赛或演唱会的日子大家会去热烈围观，可惜广告越来越多，热闹越来越少；朋友圈像自己家阳台，有好玩的好看的好吃的就呼朋唤友来坐坐，墙上挂着自己喜爱的风景的照片，最近还在茶几上摆起红包；来往更像是阿里园区食堂，来来往往都是内部员工，新人来吃饭就送5元点券！

支付市场也有马太效应，大家都用你不用就很不方便。线上环境支付宝份额占五成以上，已经没啥好争的了。打车软件的局部战争，是争夺线下支付的前线而已。当然客观上打车覆盖的人群支付能力强，对新事物的接受程度也高，加上手机又很方便给出位置信息和联系信息，暂时想不到比打车更好的推广场景了。


阿里和腾讯激烈争夺的线下支付据说被央妈一纸叫停了，二把手昨天见面会上刚说完简政放权，今天被央妈的文件打脸打的啪啪响。忙活半天两巨头白白请大家打车和给的哥送钱了，“市场经济”就是这样，权当攒人品吧。@菜场经济学家

微博的粉丝推荐也开始变现了，不过跟信息流插入广告一样，太粗糙了点。起码稍微带点人群定向嘛，我的资料里明明都写清楚了，中老年雄性理工科屌丝哪里需要什么“治痘痘神器”和“化妆品肌情”。

忘记是在哪本书上看到过的说法，一种资源的使用效率提高，带来的是这种资源的使用数量大大增加，而非由于使用效率提高就可以减少使用数量。从蒸汽机之于煤炭到内燃机之于石油，从高压电网之于电到互联网之于信息，包括云计算之于计算资源，甚至银行之于钱，都曾经或者将要沿着这条路去走。

秘密上看到一句神吐槽已收获588个赞：就怕有狼性的猪一样的队友……

来往5.0的改版可以说非常成功！因为一下子对手就从微信变成了豆瓣小组。

facebook发迹以后，很多人都以为社交网络时代已经终结了，马太效应使得谁也没法再织出那么大的一张网。但是没想到做图片的instagram,阅后即焚的snapchat,短消息的whatsapp等app,甚至只是把双向变单向的twitter,这么快就对它造成了威胁，以至于后者是要花大价钱不断收购才好像能保证自己的未来。

有一天女澡堂突然着火了，里面的女人都一块跑出来，有的捂胸部，有的捂下面，有的上下不知道捂哪里…这时旁边一个老头喊了句：“哪里都不要捂，捂脸，其他都一样”…秘密的逻辑正是如此：当你捂住脸的时候，胸部和下面就可以随意暴露。

支付宝钱包虽然有@招商银行信用卡 服务号，但就是个摆设，连查询帐单和额度都不行，微信的公众号却可以。看来不是技术原因，是银行真的把支付宝当对手了。

招股书显示阿里在移动上绝非无所作为。月活数最高的移动应用前五名，阿里占三个：手机淘宝、支付宝和UC浏览器。手机淘宝一直是最流行的电商类应用，交易额占整个移动电商市场的四分之三，而阿里本身的移动渗透率也在快速上升。用户打开这些应用时带有强烈的商业意图，通常会给商家带来显著的转化。

中国黄页上线后，马云到北京拜会当时的互联网偶像张树新。张树新很忙，花了半小时见马云。从瀛海威出来，又望了一眼那块著名的“中国离信息高速公路还有多远”牌子，马云说：“如果互联网有人死的话，张树新一定比我死得更早。第一、她的观念我听不懂；第二、我做的是企业上网，她做的是老百姓上网。”

狼如果没有了梦想，跟一条哈士奇有什么区别？！

百度、掌上百度、百度浏览器、百度导航，hao123；百度美图，百度魔图，百度魔拍，百度美秀，百度相册，百度图片，百度相机，百度识图，百度明星脸；百度音乐，千千静听（百度版），百度随身听，百度乐播；百度视频，百度电影，百度电视剧；百度理财、百度钱庄，百度百发……资源再多也经不起这么搞啊。

京东的"京"字其实来自刘强东的初恋女友龚小京，当初俩人一块创业时在中关村卖些软件光盘啥的。时过境迁好多年，今晚的女主角却是奶茶妹妹，突然觉得好感伤。

点赞党的终结者！点赞狂魔的末日！雪球网上赞一次要花一毛钱，土豪们一次就点1000个赞！赞再也不是意义含混不清的“朕知道了”，也不是“好久不见无话可说但我还在关注你不用回复了”，赞是对真知灼见的物质奖励，是真金白银的态度表达。给@雪球 点个赞！

微博加关注时的自动分组功能，好像挺智能的，其实是典型的算法产品自作聪明。对于没有任何分组的人可能有用，对于有自己一套分组和命名规则的用户除了带来打扰之外，没有任何意义——有本事你自动分到我建好的组里去呀。我经常手一滑新建了自己不想要的分组，还要跑到分组管理去把它找出来删掉，呸！

中场休息的时候看到手机淘宝的扫码世界杯广告了，不过想说的东西太多，远远没有京东618“老师在课堂提问学生突然跳起街舞”的反差型广告来的印象深刻。不过对战京东是手机淘宝代替天猫出镜，手淘在集团内受到的重视也可见一斑了。

京东也很有点精分，一边喊着开放共赢搞POP平台，一边在各种宝贝标题都带【京东自营】，结果就是POP平台卖家往往只能陪太子读书，起到的作用只是帮着从搜索引擎结果页往京东自营的宝贝去引流。

才发现亚马逊中国的首页虽然顶部和底部仍然是根据浏览记录而来的推荐模块，但中部的主体已经变成楼层化的了：服装、电器、图书、家居、商超、母婴、运动。是因为千人千面在国内电商受众对性价比极为敏感的情况下就是个伪命题，还是其他各大电商长期楼层化的用户习惯培养倒推了亚马逊的改版呢？

大众点评网->大众点评团->点评团->团购…这名字改的可真是够了。浓浓的面包牌面包，微博牌微博，这头牛可真牛，马克思去见马克思的即视感。

看看人家鹅厂的 team building 是什么场面，再看看你们的：无非冬天滑雪夏天漂流的劳什子玩意，至多也不过去青岛厦门一堆汉子玩一堆沙子，寒不寒碜。

支付宝钱包“发消息就是转账”，微信钱包“转账就是发消息”。在来往学习微信不成，半途转型做豆瓣小组后，阿里终于靠支付宝输出价值观扳回了一局。

“微信，是一个生活方式。” 这样子对生活方式不说“一种”而说“一个”的说法，最早还是在term时代水木某站友的签名档看到的。转眼好多年，在移动互联网时代又复活了。

看来云OS手机的理念，在操作系统层面打通应用间的数据通道，还是很有必要的。不然就像这样：你只刷了一次卡，结果每个应用都来通知你一遍。@算者-闫新发

QQ输入法交给搜狗维护，网易微博关门交给Lofter, 豆瓣DJ兆赫停播交给节目…可替代的产品太多了，用户其实是无痛的，往往这些产品背后的员工才是被耽误了好几年的人。

阿里市值=腾讯+百度+京东+奇虎+网易+新浪+搜狐+欢聚时代+唯品会+汽车之家 via 雪球

大公司才会试错，小公司只能试对。

支付宝钱包里面所有图标都变成红配绿，丑哭了。

奶茶和东哥的新闻已经横跨时事政治法律财经股市互联网科技娱乐八卦婚恋情感秘史了。

50个月，李厂长这次终于想通了，财散人聚啊！

在说朋友圈广告的各位，去买宝马的人难道是因为看宝马广告而买的？品牌广告的目标是在屌丝心中强化品牌形象，好让屌丝在看到高帅富开X5的时候心里想：我艹真他妈土豪！所以看到宝马广告的亲们，别会错意了…

为了提醒老板们发红包，内网热搜榜第一名被生生搜成了“红包”，想想也是醉了。

一段古老的绕口令，早就预测到支付宝和微信这场红包大战：“扁担长，板凳宽。板凳没有扁担长，扁担没有板凳宽。扁担要绑在板凳上，板凳偏不让扁担绑在板凳上。”

告诉大家一个节省时间的好办法：打开微信，依次点击 我->设置->通用->功能->朋友圈->停用。

经常听到有的人语重心长的告诉应届生，离开校园的第一份工作，不要在乎那么点儿工资，而要在乎在第一份工作中你能学到什么。我只想说：相信我，如果连那点儿工资都给不了你的公司，你也学不到什么。——应届生们请注意，阿里巴巴搜索事业部，钱多，人牛，速来！

《三国演义》开篇第一句话："话说天下大势，分久必合，合久必分。" 2011年淘宝一拆为三：淘宝集市，淘宝商城（后来改名天猫），一淘。不过四个春秋到了2015年，"万能淘宝，品质天猫，活力聚划算"，多了聚划算，没提一淘，总之三者又合一了。

Skype活该在国内做不起来：1. iPhone版的用微软账号可以登录上去，Mac版的微软帐号却死活登录不上去。2. 不得已新注册了一个Skype帐号，终于在Mac上登录成功，手工给所有联系人重发一遍申请加好友的信息。3. 想用新账号在iPhone上登录，却死活找不到更换帐号的入口，不得已删除APP后再下载重装。

网易最近做了一个考拉海购，主要发货地都是在杭州保税区，东西卖的很火，每次奶粉纸尿裤化妆品上架都是一抢而空。。。联想到国务院前几天印发的《关于同意设立中国（杭州）跨境电子商务综合试验区的批复》，当时还以为是阿里终于要发力做保税区海淘这块蛋糕了，楼主在地下室陷入了深深的思考。。。

手机淘宝之后，又有手机天猫，手机聚划算，手机淘宝电影，手机支付宝钱包，手机阿里旅行去啊……

同样是六位数字的支付密码，微信支付当输完最后一位数字就直接付款完成，支付宝钱包输完最后一位数字要再点付款按钮才完成，从用户体验的角度来讲哪个更好？

微信应该算是注册商标吧，我记得以前搜索注册商标是不能出非注册商标持有者的广告的，因为有侵权的嫌疑，移动上没这条规则了？

陌陌昨天股价大涨26.99%的真实原因是，财报会议上透露自家也要开始做拼车业务了，差点被uber抢走"第一约炮神器"的名号不是吗。

原来up24应用里面，向上和想下的箭头分别代表日出和日落！现代人对自然变化的感受完全被弱化了，空调让人没有春夏秋冬，照明让人没有日出日落。

惊闻携程把艺龙收了，联想到滴滴快的，58赶集，优酷土豆，爱奇艺pps…照这个趋势下去，我想下一步可能是 Youku Tudou iQiyi PPS Inc. 要不了多久一定会 Baidu Alibaba Tencent Inc.

我看好微博，不是因为我连续登录400天，而是因为微博是现代中国的眼睛、耳朵和嘴巴。微博具有互联网唯一的点面体式的信息扩散能力，参考柴静《穹顶之下》的传播过程，只是现在还没有找到合适的转换成RMB的方式。

今天得闲作为司机体验了一把Uber，开车4个小时跑123公里，接了4单账面收入215元。几个感受：机场真的是Uber刷单的重灾区，叫车的电话打过去之后是关机，然后用另外的电话打过来，问你刷不刷单；没有补贴没有顺路的话做Uber司机就是在学雷锋做好事，车耗油耗人工都是成本；司机是体力活里的苦差事。

终于搞清楚为何在机场uber刷单的道理：有时很难拉到乘客，司机需要空载离开机场；刷单者叫车后不用真的上车，用50元优惠券换司机给40元现金，然后司机离开机场只要跑到50元行程结束；假设补贴为2倍，扣除20%费率和给刷单者的40元，司机也获得40元。乘客得到优惠券折现，司机得到补贴，uber做冤大头。

原来做uber黑产的人士把刷单叫做"扎针"，专门给uber司机刷单的人叫做"护士"，淘宝上搜索了一下"uber护士"，瞎了我的金克拉眼，中国人真的是太"聪明"了。

支付宝摇身一变成聊天工具了，哥哥姐姐阿里旺旺来往钉钉当场愣住。

主打安全隐私保护的跨平台开源IM工具Telegram推出才两年，每天传送超过120亿条信息，而同期被FB以190亿刀重金收购的whatsapp, 每天也不过才传送640亿条信息。社交网络的更新换代太快了！也可能是换一个IM就代表换一批人脉圈，QQ上的好友很久都不聊了吧？

创业的话，从来都觉得 social 这个方向太挤了，好像失败的可能性很大，实际上又发现好像成功的可能性也很大，国内已经上市的就有微信、微博、陌陌、人人、世纪佳缘、欢聚时代，还有像知乎、雪球这些势头极佳很快可能上市的。真实世界里马太效应的极佳案例。

social 真是人类本质需求，无论是按PC/mob划分，按feed形式是图片/文字/声音划分，follow方式是单向/双向划分，甚至按行业/地域/兴趣划分，在每个细分领域都都有活得滋润的产品。陌陌，微博，雪球，linkedin, pinterest, whatsapp, instagram 概莫能外。

不让他看我的朋友圈，是傲慢；不看他的朋友圈，是偏见。#傲慢与偏见#

iOS 9改用和MIUI一样的中文字体，不用说一定是库克在向雷布斯致敬。

微信出来短信就跪了，微信群出来QQ群也跪了，朋友圈出来空间微博都跪了，紧接着微信游戏横扫手游市场，微信红包搅乱支付格局，微信运动基本替代手环⋯⋯这不，微信读书又来了。人的确是集体动物，社交数据太可怕了，所谓降维打击，诚不我欺。

看@罗永浩 相声大会——按照安装时间、使用频率、按照颜色去排列图标，按颜色排列是因为人们靠颜色去找图标。罗永浩讲了京东的例子，大家可能习惯了用红色去找京东图标。——真有这个需求，我在iOS上就是手动按照颜色排列，而且事按照“赤橙黄绿青蓝紫”彩虹的顺序，那些不用纯色的APP都被各种嫌弃。

印象笔记高级账户的介绍功能里有一项给我印象很深：“推荐相关内容”，即根据当前笔记内容，自动推荐账户内相关的笔记。——这是我唯一看到过能够直接变现的推荐系统产品了，做到能够有底气收费，说明还是蛮有自信的。

看下面的新闻十分讽刺，"中国O2O第一平台"，当美团和点评不存在？哀其不幸怒其不醒，什么时候厂长能面对市场现实了，百度才有得救。ps 要是真能收购美团也算是连接人与服务了。

作为曾经的广告从业者，对这块还是比较感兴趣的，遍历了@微博广告 涉及主要几个行业的分布情况，有机票酒店、理财证券、游戏推广、茶酒电商等，不过要说第一大行业还就是这个：约炮app下载。

高手在微博，feed流广告之前一直都是APP的推广，现在已经发展成APP推广的推广，以后可能是APP推广的推广的推广了。我建议微博直接提供九宫格分开售卖的APP推广商业产品来承接这种广告需求，跟官方“卖粉”一个道理，二道贩子代理商哪有直销来得成本低呢。@来去之间 @玩手机的小熊猫 @鱼丸酱是App控

以前我关注了100人，每天发的微博让我看不过来；后来我关注了200人，发现微博没什么可看的；我以为是我关注的人少了了，就把所有领域内的人全关注了，大约快到400人，发现还是没什么可看的。原来不是我关注的人少了，是发微博的人少了。

今天把今日头条app给删了。忍得了新闻个性化推荐有不准，忍不了看几条推个商品，又看几条推个应用下载，变现手段太粗暴而直接——用户还没感受到你有什么价值，你不能就急着把用户变成价值。

同样是feeds流广告，微博相比微信简直是low到爆！微博真是端着传播能力最强媒体的金饭碗，要着路边电线杆祛痘老军医甚至电信诈骗广告的饭，然而越low就越不会有品牌广告主来投，最终进入劣币驱逐良币的恶性循环。

5.8懒人节，5.17吃货节，5.30网红节，敢不敢再多造点名堂出来？

直播的想法最早应该是来自1998年金·凯利主演的电影《楚门的世界》。

以前是微信发生活，微博发工作；现在是微信发工作，微博发生活。全tm是围城。

饭否至少比网易微博有良心得多得多得多，人家在被关闭后还为用户提供数据打包下载的服务，网易微博自己说关闭就关闭了，只给你迁移最近五十条。网易一生黑。

老逍说"今天电商发展了那么多，在市场上有那么多层出不穷的电商网站，其实大家都知道有件事情，这些网站上的消费者曾经来淘宝买过东西吗，我敢担保80%、90%是来过的。"于无声处听惊雷。

我就说一句，当年快播最大的竞争对手不是艹榴，而是百度影音。

恁们开互联网大会在互联网上开不就好了，干嘛来现实中给人添堵。

购物app暖色居多，且红色独占鳌头，有什么心理学上的解释吗？

收藏家不是为了收藏，他们收藏的是自己逝去的青春年华。收藏夹也不是为了收藏，他们收藏的是自己的消费欲望。

眼看肉饼的pr反而让贴吧这事愈演愈烈，想起赵斌强的一句话：屁股决定脑袋久了，脑袋就成了屁股。

安卓手机的更新换代太快了。去年双十一买的红米手机做测试机，价格和今年双十一这个坚果手机一厘不差，但从外观到性能已经被秒杀到不行，做适配都嫌弃，只能进垃圾堆了。

菜菜你有所不知，这叫做网红经济，合适的仰望角度＋有温度的互动＝最具有流量价值最适合成交的网红，你看这可不就是@不加v

你在一间屋子里说话，几个人能听到；你在一个礼堂说话，几百个人听到；你在报纸上说话，几万个人听到；你在微博说话，所有人都听的到。别小看“传统生意网上接单”，阿里京东美团滴滴都是在做这句话，也都做到几百亿美金的大生意。菜菜什么都好，就是对自己不懂的领域，不能做到心存敬畏。

所以人类其实是很低能耗的计算机，未来机器人统治世界了，早晚会发现这一点。

前车之鉴，指阅，无觅，百分点…个性化阅读是个伪命题。

看了下活动规则，卖电影票居然每人限购一张！团购网站都知道电影要卖双人票！产品经理不是大煞笔，就是只能一个人去看电影的大屌丝！

投资搜狗，放弃搜索。投资大众点评，放弃线下本地服务。投资京东，放弃线上购物。下一步就是要放弃视频了吧。可是只有一个微信，真的够吗？

网友评论精选：1.单纯的年轻人不会找你们这把年纪的。2. 他漂亮你心动才是真的，单纯善良顶个毛用，太虚伪了。3. 为啥一开始赖马云阴你呢，道个歉不过分吧。4. 给奶茶买几件漂亮点的衣服吧，太村姑了。5. 本来就是个各取所需的事，你图她年轻漂亮，她图你有钱，别整的这么高尚行吗？

无论从我个人经历，身边人的表现，还是半年来的无线算法开发经验都告诉我：在私人事务方面，从PC到无线是一个不可逆的过程，顺之者昌逆之者亡。

当然不否定微博的价值，不然这个讨论也不会发生在微博上，但微博得益于公开传播，也受损于公开传播。微信的传播是可控的，更熟人化，有烟火气儿，有人情冷暖，有良辰美景。说再直白一点，微信的价值取决于你朋友的价值 or 你对朋友的价值，那些抱怨朋友圈都是中医养生谣言鸡汤营销的，你们懂的

之前是用淘宝账号登陆的高德地图，结果兑换时说我没绑定手机号，淘宝账号明明有手机号的好伐？绑定又说我号码已经被占用了（废话我自己占用的）换成用手机号码注册，验证码等一天的事情就不说了，之前朋友圈给加的油都白加了…原谅我粉转路人转黑，鄙视@高德地图 

uber也许会减少买车，但并没有减少乘车（可能还会增加），当乘客的体验很好（而且又便宜），当司机的体验太差了。所以我觉得uber去掉补贴后，最后剩下来的司机，会是一批原来就是职业黑车的那部分司机。

这就是经济学里面常说的价格歧视，用不同档次的商品（即使其实是一样的）来区分消费者。有钱人选高档的他就多赚点钱，没钱的选低档的他也能赚得到钱，跟打折机票，电信套餐，肯德基优惠券，学生证半价等相同道理。

不得不说微博插入的广告既dismatch又very low，其实优质广告主也挑地方的，继续这样下去只会劣币驱逐良币，最后变成电线杆子或者报纸中缝。

百年之后，乔布斯留下苹果产品，华盛顿留下一个美国，曹雪芹留下红楼梦，邓丽君留下甜蜜蜜，普通人留下了自己的子女，还有一些人什么也没留下。

## 生活

才知道"未来不迎，当下不杂，既往不恋"是晚清名臣曾国藩说的话，太有文艺女青年的范儿了。

努力的边际效应似乎是递减的，从95分到99分的付出可能是从0分到95分的许多倍，倒不如把这工夫在另外的事情上也做到95分。但是。努力的边际效应其实是递增的，因为从95分到99分的所越过的人，也是从0分到95分所超过的人的许多倍。

跟傲慢的政府办事处、冷漠的人力资源代理和狡猾的保险公司打交道，办证和盖章就像在城市的丛林里努力集齐各种宝石锻造宝剑，端底是把人玩得身心俱疲。

手机能让一个人独处的时候也不寂寞，也能让大家都在一起的时候却很寂寞。

晚睡是一种很玄的东西！晚睡是一种说不出的痛！晚睡是一种病！

"一只站在树上的鸟儿，从来不会害怕树枝断裂，因为她相信的不是树枝，而是她自己的翅膀。" 这碗鸡汤适合端给那些挣扎在职场/情场/官场/名利场的人。

我已经发现医院的盈利模式了。公立医院是先去化个验然后开一小盒头孢同时开几大盒中成药回去多喝水，私立医院是你这个再不手术以后发展成什么样我可就说不好了。

王菲"夫妻缘尽至此"时就有人说，男人们都在姐姐那儿成长，最后都找了妹妹，放在马伊琍"且行且珍惜"这里仍然没错。

岁月只是对那些原本长得很好看的人才会无情，而那些从生下来就不好看的人，岁月可拿他们一点办法都没有。

@wentrue-阿稳 你离职后旺旺退隐江湖了但还显示手机在线，所以@冯诺伊森 给你发了条信息确认你还能不能收到，如下图。另外他还担心实习生离宵回来以后，首先会找不到我们（因为换工位），找到我们会发现找不到电脑（因为搬电脑），找到电脑会发现找不到主管（因为你走了）。这感受会不会太糟糕。

"钱不是万能的"是穷逼最先提出来的，"没有丑女人只有懒女人"是丑逼最先提出来的，"勤能补拙"是笨蛋最先提出来的，作为天生的弱者，我们总要编点理论作为支撑，欺骗自己勇敢的活下去。

晚睡强迫症患者刚去肯德基吃夜宵，看到@翠苑派出所 的007和011两位巡防员在凌晨一两点仍然辛苦值班，致敬！不过当时店里同时有几位酒喝的脸通红的XJ兄弟，没警察在的话我肯定立马掉头走了。肯德基仍然生意不错，只想真诚的说一句：过期的又没有毒…比地沟油或者三聚氰胺还是强一点，至少吃不死人。

广场大了什么舞都有，有抒情写意慢节奏的一拨，有扭秧歌二人转风格的一拨，有穿红绿纱布拿扇子的一拨，不过人数最多的，居然是拿着一块木板照着身体上下各部位有节奏的击打那一拨。

说一件同事身上发生的真事，背景也说下大家可能已经知道，就是入职阿里之后都会分到一个花名，比如马云的花名就是风清扬。有天这个同事出去吃饭忘带工卡，回来时楼下保安小哥拦住他问，你艺名是多少……就酱你知道大家出来卖艺也挺不容易的。

上个月车牌竞价当天晚上，老板专门发消息问拍牌成果如何，结果呵呵了。在老同事群里冒泡，发什么已经不再重要，因为大家开口就问你的车牌呢。没拍到浙A俨然已经成为我的人生污点，反思自己的一再失误，是对车牌的资源性认识不足，也是鸟哥曾说过我最大的缺点犹豫不决。无论如何这个月一定要果断了。

就像小时候工人家庭常见的那种，印着比如说"临涣煤矿安全生产10周年纪念"的，功能不限于刷牙喝水和打饭的搪瓷缸子，还能看到杯口和杯底的搪瓷都斑驳了，露出里面的点点锈迹。虽说是高大上的IPO纪念T恤衫，却做到了浓浓的搪瓷缸子既视感。

刚刚转了一条说是西湖区有三岁小女孩被拐的微博，被@暴君祥子 提醒没有照片很可疑，而且留的电话号码有问题，搜了一下果然是吸费的诈骗号码！人贩子该死，骗子更是无耻，居然利用为人父母的同情心，用发布小孩被拐消息的方式来传播吸费电话号码。

要离职啦，开始喷雇主怎么样对不起自己，是一件很没品的事吧，离婚还讲究好聚好散呢。去年996之后注意是之后也离开了不少人，可以说其中也大有公司对不起的人，像某些人这么公开喷的还没有过，人情和道理。

我的高考已经过去十一年了。不过现在还是经常会做那时候的梦，梦里就是高三教室的情景，和一群认识不认识的同学等待着高考，想着这个大学好还是那个大学好，无非是些高中生才关心的东西。——可能是吧，十八岁的时候的确可能是很快乐，但即使能回去我也懒得回去了，成长太累。

饶我行走江湖多年，今天早上从华腾美居酒店去上班，在酒店门口着了“中国黄山外事局旅游公司”的茶叶骗子的道，看他着急开车走才发觉中招了。事后反省当时一听是老乡就放松了警惕，帮他忙花600大洋买了一堆劣质茶叶。骗子骗人的时候可不像骗子啊，这回是认真上了一课，大家引以为戒。@平安北京

成功的人生必有几次成功的all in, 不服来辩。

接着前天继续发鸡汤。为什么说出名要趁早？人生就像一个积分，刚开始要高一点，即使后来导数不行了，最终积累出的结果也不会太差。

当一个团队开始各种搞平衡，他就是在走下坡路啦。不仅仅是劣币驱逐良币，而是整体激励氛围的变化，对生产力造成不可逆的破坏。

维也纳公共交通体系极为发达，7.6欧的通票在24H内公交电车地铁可随意换乘。最惊奇的是，地铁没有安检也没有检票口，买不买票全凭自觉，这是个假设是人人都是好人的社会，信任降低成本的好例子。

人之所以痛苦，在于追求错误的东西。

爱的能力也需要后天不断练习。爱的效果是以接受者的感受为依据。爱的五种语言，你值得拥有：1. Quality Time 2. Gift 3. Acts of Service 4. Physical Touch 5. Words of Afformation 

虹桥火车站候车待了20分钟，先后招呼我乞讨钱财的人有：一个拄着双拐表示自己残疾的军大衣中年男，一个拿着纸笔表示自己聋哑的粉红袄戴眼镜女童，一个背着睡觉的婴儿表示自己可怜的青年妇女。#你不知道谁摇身一变就是乞丐#

生活不只是眼前的苟且，还有苟且和苟且。

快车司机师傅一边开车一边开着微信语音群，不时凑上去说几句话，诸如昨晚吃的什么，拉了一个什么样的乘客，哪条路又堵起了之类很无聊的话。人果然都是害怕孤独的动物。

2.14情人节，3.15消费者节，5.17吃货节，6.18京东节… 好像发现了一些什么，但4.16是什么节？

到了一定的人生阶段，脑子里面就装满了太多乱七八糟的事情，只有坐班车、洗澡、独自吃饭等少数几个场合能稍微想个明白。dropbox用不了，文件也没整理，paper也没空看。睡不着，也不困，谁能想到央视半夜的时候居然播放的是美食类节目。哎，真是语无伦次，得买点闲书来看了。

地图所示文一西路何家坝公交站对面，人行横道挡车的石头被移开，时不时有车从中穿过掉头或左转。因为这里是两座桥的中间，车速很快，很容易造成追尾交通事故，请交警市政尽快处理。上回报告后早上修复，晚上又被人搬开了。每每路过多有惊悚，盼永久解决。@平安杭州 @平安西湖 @余杭交警 @余杭公安

文一西路何家坝公交站对面人行横道加了栏杆，问题应该永久解决了。感谢@余杭交警 及时响应，感谢市政工程，感谢微博平台。

自古以来教育即资本比拼。

山东很多县市的非国营企业默认是六天工作制。

杭州的确是城市建设中的 bad case 从市区到郊区，从公共交通到机场高铁，从文一路到文三路，从上塘高架到德胜高架，处处都是败笔……

也就是国企吧裁员分流这么大阵仗搞这么悲情，私企说散就散了，一阵风都不会留下。

表面看是一表二表三表，里面代表的是阶级。这样的政策是为了鞭策我们做家长的，要继续努力奋斗。加油吧中年。

杭州地铁只有一条就学人家搞限牌是东施效颦，城西文一文二路长期堵车暴露杭州市政府执政能力，G20峰会只会加剧暴露。。。等下有人敲门我去看看。。。

酒饮微醺后，我就又有诗，又有远方。

阿里内网一个什么活动，报名通过的列表都是花名。底下有个人就评论说：真像宝宝起名大全。。。

凡是资源配置，晚来的总是要被早来的欺负。不光是房价，车牌竞价也是这样的，以前不要钱的现在要竞价了，那就看转变的时刻谁能最先适应。

作为体系之下曾经很顺利过，现在可能是处于很不顺利阶段的过来人，想分享一点：价格不会长期偏离价值，既不要否定体系的科学性，也别太在意其中条条框框，要看自己在打工挣钱之外的收获。

西二旗那么多的工作机会在那里摆着，就算每天节省通勤时间一小时，就值这个钱。何况码农子弟聚集的地方，往往是自然而然就变成了好学区，升值空间大。看看上地东里，几年时间不知不觉摇身一变就成学区房。另外据说知本时代当年不大好卖，找来各路的山西煤老板都是十几几十套的买，还是钱最能生钱啊。

专家其实有道理。高昂的房租导致外地人如果工资跟本地人一样就无法生存，留下的外地人都是外地人中的精英，青壮年比例更高，受教育程度更高。因此外地人对社保的输入功率更高，但很多人会离开，而本地人是不会离开的。以上不包括农民工和服务员，他们不缴纳社保但也享受不到养老医疗教育等核心资源。

前有北电西门子先例，后来又被收购，诺基亚不是今天才知道要不行的！没有体会到通信行业走下坡路，或者体会到但一直不想办法，未雨绸缪的给自己找到退路，是这个博士最大的问题。一个职场上被温水煮青蛙的典型案例。

## 书影音

看完《暗时间》这本书，有一个观点我体会很深。遇见20万年前的自己：大意是说活在工业时代的人很多不理性行为难以控制，实际是进化还停滞在远古造成的。比如对高热量食物的过分偏爱，对虚拟网络游戏的精力投入，对小圈子面子的过分在乎，只看重眼前的短期利益却不去做明显长期有益的事。

看完@雪球 投资访谈的书，印象最深刻的是，所有能国内股市赚钱的人，集中在特定时段内极少数几只股票上。从90年代开始的长虹和万科，然后是进入新世纪是的伊泰和神华等能源行业，最近几年是格力和茅台等享受型消费行业，基本上都反映出当时最迫切的需求。

高铁上囫囵吞枣了《信息简史》这书，分享一个有意思的看法：贝尔才是摩天大楼之父。就像电梯，是电话才使得摩天大楼成为可能，假如没有电话，以每天每个大楼进进出出的信息而言，要多少信使上上下下跑多少趟来传递，而这需要增加多少电梯，从而使建筑结构不再划算。所以，是电话重塑了纽约的天际线。

没抱太高期望去看吴军博士跨界之作《文明之光》，没想到很有见解，很合胃口。比如讲南宋和蒙古持续50年的战争，是"所有国家中坚持抵抗最久的"。讲到野蛮战胜文明，"在人类历史上，并非下一代人一定比这一代人生活的更好。我们今天的生活比父辈和祖辈好很多，很大程度上得益于二战后近70年和平环境"。

看完了《文明之光》，最喜欢的两章是第十章"荷英时代"和第十一章"谈出来的国家"，对近现代取得成功的政治和经济制度做到知其然知其所以然。经过科学训练的人容易陷入细节，但作者常能从细节跳出，兼具大局观和历史感，还有自成一派不落窠臼的观点，足见@吴军博士 敢写跨界之作还是有底气的。

人生像条大河，可能风景清丽，更可能惊涛骇浪。你需要的伴侣，最好是那个能够和你并肩立在船头，浅斟低唱两岸风光，同时更能在惊涛骇浪中紧紧握住你的手不放的人。换句话说，最好她本身不是你必须应付的惊涛骇浪。via《亲爱的安德烈》

逗逼同事说：关于电子书阅读体验，多看比豆瓣好一百个亚马逊，一千个淘宝阅读。via @冯诺伊森

当你老了，回顾一生，就会发觉：什么时候出国读书、什么时候决定做第一份职业、何时选定了对象而谈恋爱、什么时候结婚，其实都是命运的巨变。只是当时站在三岔路口，眼见风云千樯，你作出抉择的那一日，在日记上，相当沉闷而平凡，当时还以为是生命中普通的一天。via《杀鹌鹑的少女》

回老家居然收拾出来一本小学时候爱看的杂志，@郑渊洁 的《童话大王》，这期是1997年3月刊。还记得当时如获至宝的心情，一转眼十八年已过去了。

《重新定义公司：谷歌是如何运营的》是一本很诚实的书，不回避不浆糊，把Google退出中国的前前后后讲的很清楚，自然也提到了伟大的墙。——作为公司如何达成共识做出艰难决策的典型案例。

"谷歌那些声名远扬的免费服务，不仅仅是提供员工福利，提高员工的生产力，很大的一个目的是增加他们的互动。2009年我参观谷歌的时候，他们介绍到餐厅等待的时间基本控制在4分钟，正好让人可以简单寒暄和交流（大于4分钟就很可能拿出手机干自己的事了）" 《重新定义公司：谷歌是如何运营的》

看过《镜花缘》一书，内有"酒色财气"四阵，最厉害的是"气"阵，大概明白。//@财上海：酒色财气？你知道第四个字是什么意思？我也是混了20年，才搞懂的。

其实讲的是告别的故事：告别被遗弃的故乡、告别被烧毁的老屋、告别青梅竹马小伙伴、告别疑似智障少年的跟班、告别不从良的情人、告别臆想中的爱人、告别死过两次的父亲、告别属于骗子的汽车、告别发射失败的旅行者理想、告别换工作的朋友、告别沙漠中看得见的狗。千里相送终有一别，然后《后会无期》。

最近看的几部新近韩国电影，《我的PS搭档》、《攒钱浪漫史》、《高龄化家族》、《开心鬼上身》，三星现代甚至足球什么的且不去说，不知不觉中邻居用电影讲故事的水平也已经甩咱们好几条大街了。

强烈推荐黑镜第三季，虽然只有一集。人工智能要达到能模拟出人类智能的水平，伦理的挑战会比技术的挑战更大。

儿子一岁半不到，是刚刚嘴里能蹦几个字的年龄，特喜欢看动画片《熊出没》。今天像往常一样给他放动画片，恰逢爱奇艺插播了<奇葩说>的广告。看到高晓松先生，儿子忽然大声的说：“熊大！熊大！” 定睛一看，还真有点像。

音乐真是具有神奇的力量，《信仰》的前奏响起，二十年前上初中的那些过去的日子好像都清晰记起来了。

日本文化真是有意思，什么小事情都值得写一本书《怦然心动的人生整理魔法》《有钱人为何都用长钱包》《当我谈跑步时我在谈些什么》《春夏秋冬四季便当》《开间自己的小店过自己想过的生活》都是用心做细小的事并总结出人生道理。

有时候觉得古人太厉害了。季节，景致，人物，心情，所有一切他就用二十个字就完全表达完了，不用多说其他任何一个字，完全就是诗里表达的这样。

## 足球

特别喜欢看德国队的比赛，一脚传，所有人都不带球，这样的传接配合总能让人赞叹不已。

德国队以前是头球队，现在是定位头球队。葡萄牙吃了点球，中后卫又认领了红牌，比赛可以说已经提前结束了。PS：第二球进球后给了默克尔一个镜头，习大大肯定很羡慕吧。

青年是看世界杯的最佳人生阶段没有之一，幼年少年懵懂看不懂，中年老年事多看不进，趁年轻有精力看球，就是花开堪折须折花。这就像，小组赛第二场永远是世界杯最值得看的阶段没有之一，第一场磨合，第三场磨洋工，只有第二场，赢的那个要出线，输的那个不想出局，最最精彩。

女主持人刘同学哭起来了，最不理解的是，他为什么要咬人呢？男主持人安慰她，别难过还有2018世界杯呢，我们知道，2018是狗年。听罢，女主持人哭的更厉害了。

克罗地亚最大的sb是维达，好好做后卫不就行了，非要往前去抢射门，浪费多少好机会。葡萄牙也是踢的脏，全场28次犯规，平均4分钟来一次，应该是最不像欧洲球队的欧洲球队。

法国队要技术有技术，要身体有身体，要决心有决心，要战术有战术，要主场是主场，凭什么不赢，我是爱尔兰我也郁闷，这跟一穷二白三无能力四无背景又进了拼爹的国企有什么区别。不过还是多问一句，法国真的不是在非洲的吗？

很难有一支球队像四星德国这样有这么多绝活，个高所以是头球队，腿长所以是铲球队，没有大牌所以是传球队，不留情面所以是进球队，金发高鼻所以是帅哥队，主教练挖鼻屎所以是话题队。我喜欢德国队，希望可以走更远。

这种大雨倾盆的鬼天气，想打出什么精妙的脚法是比较困难的，相比之下西班牙更吃亏点，这场以子之矛攻子之盾主要就看定位球的了。胜者下场还要去死磕德国，从此之后场场都是决赛，解说员说的一点没错，谁能从这死人堆里站出来，谁绝对就是涅槃的凤凰。

靴子落地了。只要没进加时，怎样都好。这届西班牙不行，下来就看德国怎样虐，碎觉！
