---
title: CMakeLists.txt格式和.h头文件的格式
date: 2021-10-19 20:48:00
categories:
- [IDE config]
tags:
- JetBrains
- Clion
- IDE

---

本文介绍CMakeLists.txt的格式和.h头文件的格式。

<!-- more -->

## CMakeLists.txt

```cmake
#声明要求的cmake最低版本
cmake_minimum_required( VERSION 2.8 )

#声明一个cmake工程
project( HelloSLAM )

#添加一个可执行程序
#语法：add_executable( 程序名 源代码文件 ）
add_executable( helloSLAM helloSLAM.cpp )

#添加一个库
#语法：add_library( 库名称 源代码文件 ），会生成 lib库名称.a（静态库）
#语法：add_library( 库名称 SHARED 源代码文件 ），会生成 lib库名称.so （共享库）
add_library( hello libHelloSLAM.cpp )

#将可执行程序链接到库
#语法：target_link_libraries ( 程序名 库名称 ）
target_link_libraries ( helloSLAM hello )

#指定头文件目录
#以eigen为例，eigen的头文件目录为"/usr/include/eigen3"
include_directories( "/usr/include/eigen3" )
```

## .h head file

```c++
/*源文件为libHelloSLAM.cpp的头文件libHelloSLAM.h*/
#ifndef LIBHELLOSLAM_H_
#define LIBHELLOSLAM_H_
/*源文件中定义的函数名称*/
void printHello();
#endif
```

## 参考资料

CMakeLists.txt和.h头文件：https://blog.csdn.net/qq_38329197/article/details/86500071
