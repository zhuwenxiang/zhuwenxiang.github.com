---
layout: post
title: R的状况系统
date: 2012-04-01 17:55
comments: true
categories: R
---
这篇日志有挂羊头卖狗肉的嫌疑，与其我在说所谓状况系统，不如说只是在讲tryCatch()这一个函数。

先是一段稍显得有些辩证的道理。我们知道，小概率事件一定会发生。如果程序有可能出错，则它一定会出错。一旦出错则代码停止工作，这里可能并没有可以修复的地方，比如你要读取的是一个被别人移动了的不存在的文件。错误不一定会导致bug，但忽视对错误的处理就总可能作一个bug。

R的状况系统(condition system)提供了一种对类似异常状况提示和处理的机制，包括错误(errors)和警告(warnings)。状况是包含状况发生的信息对象，这信息包括诸如一段消息和当状况发生时要做的动作。状况在R中被定义为S3型对象，实际上，状况可用来输出警告而不会中断产生警告的那些代码的执行，并允许调用栈中更高层的代码来控制是否打印警告信息。

tryCatch()函数计算可用的由上下文给定的...句柄指向的表达式参数，如果没有状况提示，则计算表达式且返回表示式的值。如果计算表达式时有状况提示则建立检查的句柄，从最近表现出的信号开始建立对应的状况类，之后根据状况类的重启表达式参数的句柄。

R当中的Calling Handler基于Common Lisp和Dylan语言，Restart基于Common Lisp语言，这些都是典型的面向对象的函数式语言。tryCatch机制和Java的错误处理机制相似，但是比它更灵活。因为状况系统可以将错误处理代码拆成两部分，首先可以记录错误，其次将那些实际从错误中恢复的代码放在再启动中。在循环或者apply系列函数中，这是一个极其美妙的特性，他让你不需要考虑循环中可能出现的各种异常情况，而可以仅专注于正常的case。

几个简单的示例如下
<pre class="brush: r; gutter: true">tryCatch(print(&quot;passes&quot;),  error = function(e) print(pi)) # =&gt; passes
tryCatch(stop(&quot;fails&quot;),  error = function(e) print(pi)) # =&gt; pi

for(i in 1:10){
result &lt;- try(stop(i));
if(class(result) == &quot;try-error&quot;) next;
}</pre>
<pre>这上面其中提到的“try-error”类的继承关系如下
~~+--try-error
~~~~~~~|
~~~~~~~+--condition
~~~~~~~~~~~~|
~~~~~~~~~~~~+--error
~~~~~~~~~~~~~~~~~|
~~~~~~~~~~~~~~~~~+--simpleError</pre>
<pre></pre>
<pre>参考文献：</pre>
<a href="http://rss.acs.unt.edu/Rdoc/library/R.oo/html/Exception.html">http://rss.acs.unt.edu/Rdoc/library/R.oo/html/Exception.html</a>
<a href="http://www1.maths.lth.se/help/R/ExceptionHandlingInR/">http://www1.maths.lth.se/help/R/ExceptionHandlingInR/</a>
