---
layout: post
title: 小议独立事件
date: 2012-04-29 01:46
comments: true
categories: 概率统计
---
<p>首先我们解决的问题是，为什么独立事件的定义就是满足P(AB)=P(A)*P(B)？这个等价性要从条件概率说起，我们知道事件AB独立的一个显著推论是B发生对A没影响即P(A|B)=P(A)，而根据条件概率的算法P(A|B)=P(AB)|P(B)，代入从而得证。</p><p>很容易计算出三个事件独立则一定两两独立。而一个概率论中很著名的反例是，有没有三个事件是两两独立却不相互独立的例子？</p><p>一均匀的正四面体，其中三面分别全部染上红，黄，蓝三色，最后一面上红黄蓝色皆有。在桌子上将此四面体任意掷一次，考察和桌面接触之后，桌子上面出现的颜色是什么。设事件A=红色，B=黄色，C=蓝色。则P(AB)=1/4=P(A)*P(B), 但P(ABC)=1/4&gt;P(A)*P(B)*P(C).</p><p>在微博上转发了这个例子后，有同学追问说，有没有AB独立，BC独立，但是AC不独立的？</p><p>这里给出一个想法类似以上的例子，给正方形的四条边分别涂成蓝色、红色、黄蓝各半、黄红各半。选出任意一条边，设事件A=蓝色，B=黄色，C=红色。</p>
