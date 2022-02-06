---
title: 如何创建Beamer样式模板
date: 2022-02-06 23:49:00
categories:
- [LaTeX]
tags:
- LaTeX
- Beamer
---

如何创作一个Beamer模板，包括如何修改常用元素的主题。

<!-- more -->

## 前言

本文是对The beamer class Manual for version 3.06内容的重构。

主要内容集中在如何创作一个Beamer模板，包括如何修改常用元素的主题。

您可以通过以下链接访问原文：https://www.docin.com/p-1206582079.html?qq-pf-to=pcqq.c2c

## 主题

主题其实包含主题（beamerthemexxx.sty）、内主题(beamerinnerthemexxx.sty)、外主题(beamerouterthemexxx.sty)、字体主题(beamerfontthemexxx.sty)、颜色主题(beamercolorthemexxx.sty)五个部分，分放在五个sty 文件中，写完这五个 sty 文件，再在你的文档中，使用usetheme{xxx}，将你创作的主体包含进来即可。

引自https://lusongno1.blog.csdn.net/article/details/83009395

以上的话说的比较简洁，其实情况为：Color Theme只决定了颜色，Font Themes只决定了字体，Inner Themes决定了Frame环境下内部的枚举环境，块环境，定义环境，定理环境等样式，Outer Themes决定了frame中上下栏，左右侧栏，导航栏等元素的样式。

而Presentation theme包含了以上所有四个内容，但是这四个内容可以相互独立替换。所以最好的情况是给出这五个文件，这样人家可以使用你的主题，也可以在使用别的主题的时候单独使用你的字体样式，或者别的样式

## 内主题

内主题包含以下9种元素的样式：

title 标题，enumerate 有序枚举，itemize 无序枚举，block 块，description 描述环境，proof和theorem 证明和定理，graphic和table 图片和表格，footnote 脚注，bib 引用

### 无序列举

\setbeamertemplate{itemize items}{\color{red}$\bullet$}

### 有序列举

具体见颜色的设置

### 块

显示圆角矩形：

\setbeamertemplate{blocks}[rounded]

显示阴影：

\setbeamertemplate{blocks}[rounded][shadow=true]

## 外主题

外主题包含了以下元素的样式：
上下栏，侧栏，logo，frame title

### 上栏

使用\setbeamertemplate{headline}{}

插入导航条：

\insertsectionnavigationhorizontal{宽度}{左侧文字}{右侧文字}：样式为水平的导航条，显示所有section，高亮当前section，宽度为导航条宽度，尽量不要太大。左右侧文字是你希望插入在每一个section旁边的符号。

我发现一个问题：使用\setbeamercolor{headline}{fg=,bg=}的方式，改变的是高亮和常规的颜色，而不是headline背景的颜色，这个问题还是没有解决。

\insertsectionnavigation{宽度}：这个导航栏是竖直的，不建议使用。

还可以插入作者，机构之类的，但是不常用。

### logo

导入logo图案：

\logo{\includegraphics[height=0.5cm]{logo.pdf}}

插入logo：

\insertlogo inserts

## 字体主题

字体主题包含了所有元素的字体的大小和样式

\setbeamerfont{名字}{选项}

参数：名字是指定的元素，比如block，frametitle一类的。

选项：

size:字体的大小
series:字体的样式，\bfseries 加粗
shape: \itshape 斜体，\slshape 伪斜体, \scshape 小型大写, \upshape 直立
family:字体的格式

此图引自：https://blog.csdn.net/y11235816/article/details/91048416

命令	对应字号
\script	六号
\footnotesize	小五
\small	五号
\nomalsize	小四
\large	四号
\Large	三号
\LARGE	二号
\huge	一号
\Huge	小初
\HUGE	初号

以下内容引自：https://www.cnblogs.com/LitBro/p/12074820.html

导言区使用 \usepackage {ctex}

字体	使用方式	另一种使用方式
宋体	\songti	\CJKfamily{zhsong}
黑体	\heiti	\CJKfamily{zhhei}
仿宋	\fangsong	\CJKfamily{zhfs}
楷书	\kaishu	\CJKfamily{zhkai}
隶书	\lishu	\CJKfamily{zhli}
圆体	\youyuan	\CJKfamily{zhyou}
微软雅黑	\yahei	\CJKfamily{zhyahei}

比如想设置标题为楷书，则使用：\setbeamerfont{title}{family=\heiti}

## 颜色主题

颜色主题包含了所有元素的前景（字体颜色）和背景

字体颜色的设置命令：\setbeamercolor{名字}{选项}

该命令有两种用途，可以对一个颜色进行命名，可以设置一个元素的颜色

参数：

名字：元素的名字或者颜色的名字，颜色的名字自己取，可以包含空格

选项：

fg=color:前景色
bg=color:背景色
parent={A,B}:表示当前样式是样式A和样式B的叠加

颜色使用xcolor的方式书写，下图引自:

https://blog.csdn.net/weixin_29657201/article/details/78161537

或者用red!50表示50%的红色，用 颜色!数字!颜色 表示百分之多少的前一种颜色和后一种颜色混合
beamer中字体使用fg改变颜色，背景使用bg改变颜色

主要可以改变fg和bg的是footline 页脚，headline 页眉，sidebar 侧边栏，frametitle 页标题，navigation 导航栏，title标题，block body 块，block title 块标题，normal text 内环境外的字体 alert text 显著字体， section in toc，ciber 侧栏，enumerate body：有序枚举

主要可以改变fg的是：author，institute，date，subject

主要可以改变bg的是：background canvas

## 参考资料

如何创建Beamer样式模板

https://blog.csdn.net/HGGshiwo/article/details/113774758