---
layout: post
title: "如何让Surface Pen响应JetBrain IDE"
author: Fentaniao
tags: [jetbrains, process]
category: jetbrains
---

## 问题描述

在Jetbrains的IDE中，程序无法响应Surface Pen输入。

## 解决方案

1. 选择“帮助-编辑自定义vm option”，
2. 添加“-Dcom.jetbrains.default.touchscreen.mode=true”

C:\Users\ruiyangzhou\AppData\Local\JetBrains\Toolbox\apps\IDEA-U\ch-0\212.5284.40.vmoptions

## 来源

PyCharm 社区版 2020.1：Surface Pro 平板电脑上的 Surface Pen 不响应

https://youtrack.jetbrains.com/issue/JBR-2490
