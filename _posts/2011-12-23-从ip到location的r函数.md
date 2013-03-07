---
layout: post
title: 从IP到Location的R函数
date: 2011-12-23 17:15
comments: true
categories: []
---
有时网站日志（access log）数据中会有当前这次访问的IP地址，蕴含的信息其实是当前访客的地理位置or电信服务商位置。我们知道在现实生活中，推荐或者促销的一个重要维度实际上是地理位置。这跟羽绒服&amp;加湿器在南方滞销而在北方就会畅销，制冷空调在南方畅销而在北方滞销是一个道理。因此如果可以实现从IP到Location的转换，就能可以用IP来一定程度上模拟出当前客户的地理位置。下面是国外网站上的一个API接口，实现了这种转换 <a href="http://www.datasciencetoolkit.org/ip2coordinates/125.39.132.33">http://www.datasciencetoolkit.org/ip2coordinates/125.39.132.33</a>

以下是根据这个API接口包装的R function可以批量实现上述转换，不过目前的速度还比较慢。
<pre class="brush: r; gutter: true">IPtoLoc &lt;- function(x) {
   URL_IP &lt;- paste("http://www.datasciencetoolkit.org//ip2coordinates/",
                   x, sep = "")
   api_return &lt;- readLines(URL_IP, warn = F)
   str_elements &lt;- gsub("[^[:alnum:].]", "",
                        strsplit(api_return, "\"")[[1]])
   return(paste(str_elements[grep("longitude", str_elements)+1],
                str_elements[grep("latitude", str_elements)+1],
                sep = "; "))
}
#Location of KuanDaiTong
IPtoLoc("125.39.132.33");
#"116.388298034668; 39.9289016723633"</pre>
&nbsp;
