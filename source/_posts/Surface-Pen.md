---
title: JetBrains IDE无法响应Surface Pen输入
date: 2021-10-17 09:01:07
categories:
- [IDE config]
- [Surface]
tags:
- JetBrains
- Surface
- IDE
---

所有的JetBrains IDE无法响应Surface Pen输入。

<!-- more -->

## 解决方案

1. 选择“帮助-编辑自定义vm option”，
2. 添加“-Dcom.jetbrains.default.touchscreen.mode=true”

C:\Users\username\AppData\Local\JetBrains\Toolbox\apps\IDEA-U\ch-0\212.5284.40.vmoptions

## 来源

PyCharm 社区版 2020.1：Surface Pro 平板电脑上的 Surface Pen 不响应：https://youtrack.jetbrains.com/issue/JBR-2490
