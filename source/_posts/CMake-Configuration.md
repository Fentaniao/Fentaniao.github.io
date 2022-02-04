---
title: CMake Configuration
date: 2021-10-19 20:48:00
categories:
- [IDE Configurtion]
tags:
- Jetbrains
- Clion
- IDE
---

这是CMake设置的模板。

<!-- more -->

# CMake Configuration

[TOC]

## 开头设置

```cmake
#cmake_minimum_required
cmake_minimum_required(VERSION 3.20)
#项目名称
project(#项目名称)
#CMAKE版本
set(CMAKE_CXX_STANDARD 14)
```

## 添加支持

### 完全支持

#### 支持多文件分别编译运行：项目根目录下所有的 .cpp 文件

```cmake
#支持多文件分别编译运行
message("<< Support exes: ")
#遍历项目根目录下所有的 .cpp 文件
#要求所有cpp文件命名不重复，不能含有中文，不能含有‘/’等字符
file(GLOB_RECURSE files *.cpp)
foreach (file ${files})
    #获取文件名
    string(REGEX REPLACE ".+/(.+)\\..*" "\\1" exe ${file})
    #添加
    add_executable(${exe} ${file})
    #发送完成消息
    message(\ \ \ \ --\ src/${exe}.cpp\ will\ be\ compiled\ to\ bin/${exe})
endforeach ()
```

#### 支持多文件分别编译运行和GTest：项目根目录下所有的 .cpp 文件

```cmake
#支持多文件分别编译运行和GTest
message("<< Support exes & GTest: ")
set(googleTestDir ./googletest)

#Add the google test subdirectory
add_subdirectory(${googleTestDir})
#include googletest/include dir
include_directories(${googleTestDir}/googletest/include)
#include the googlemock/include dir
include_directories(${googleTestDir}/googlemock/include)

#搜索路径下的文件并添加至列表list，列表名为SOURCE_FILE
file(GLOB_RECURSE files *.cpp)
#遍历项目根目录下所有的 .cpp 文件
#要求所有cpp文件命名不重复，不能含有中文，不能含有‘/’等字符
foreach (file ${files})
    #从绝对路径中获取相对路径
    file(RELATIVE_PATH path "${CMAKE_BINARY_DIR}" "${file}")
    #获取文件名
    string(REGEX REPLACE ".+/(.+)\\..*" "\\1" exe ${path})
	#添加
    add_executable(${exe} ${path})
    target_link_libraries(${exe} gtest gtest_main)
    target_link_libraries(${exe} gmock gmock_main)
    #发送完成消息
    message(\ \ \ \ --\ src/${exe}.cpp\ will\ be\ compiled\ to\ bin/${exe})
endforeach ()
```

### 功能支持

#### 支持GTest：仅连接list中的 .cpp 文件

```cmake
#支持GTest
message("<< Support GTest: ")
set(googleTestDir ./googletest)

#Add the google test subdirectory
add_subdirectory(${googleTestDir})
#include googletest/include dir
include_directories(${googleTestDir}/googletest/include)
#include the googlemock/include dir
include_directories(${googleTestDir}/googlemock/include)

#仅连接list中的 .cpp 文件
#list(APPEND SOURCE_FILE
#        test.cpp
#        search/hashSearch.cpp
#        )
#add_executable(GTest ${SOURCE_FILE})

## Link with GoogleTest
#target_link_libraries(GTest gtest gtest_main)
##Link with GoogleMock
#target_link_libraries(GTest gmock gmock_main)
```

### 添加目录

```cmake
#添加目录
include_directories(.)
```