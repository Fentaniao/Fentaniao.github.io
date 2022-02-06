---
title: 多台电脑共用SSH Key
date: 2022-02-05 18:06:00
categories:
- [git]
tags:
- git

---

实现SSH Public/Private Key的在多台电脑中的共用。

<!-- more -->

## 步骤

### 首先我们给旧的MBP起名叫OLD, 新的叫NEW，方面后面区分

### 拷贝OLD上的id_rsa和id_rsa.pub到云端/U盘/邮箱/…中备份。这两个文件位于用户目录下的隐藏文件夹~/.ssh/中。

### 在NEW的终端(Terminal)上执行

```bash
git config [--global] user.name "[name]" //请保持和以前一样
git config [--global] user.email "[email address]"
ssh-keygen -t rsa
```

这样会在NEW的~/.ssh/中生成新的id_rsa和id_rsa.pub。

### 用备份好的OLD中的id_rsa和id_rsa.pub文件，覆盖NEW上对应的文件

### 确保NEW上的两个文件的权限是正确的

id_rsa是600，id_rsa.pub是644，比如：

```bash
-rw------- 1 fancy fancy 1675 2013-03-19 12:55 id_rsa
-rw-r--r-- 1 fancy fancy 406 2013-03-19 12:55 id_rsa.pub
```

OK, 完事。

------

## SSH登陆的原理

接下来说一下SSH登陆的原理，就可以让我们弄明白这种共用Key的方法的由来。

### 什么是SSH

SSH是一种网络协议，用于计算机之间的加密通信。

### 公钥Public Key与私钥Private Key

SSH需要生成公钥Public Key和私钥Private Key, 常用的是使用RSA算法生成id_rsa.pub和id_rsa。
公钥Public Key(id_rsa.pub)是可以暴露在网络传输上的，是不安全的。而私钥Private Key(id_rsa)是不可暴露的，只能存在客户端本机上。

所以公钥Public Key(id_rsa.pub)的权限是644，而私钥Private Key(id_rsa)的权限只能是600。如果权限不对，SSH会认为公钥Public Key(id_rsa.pub)和私钥Private Key(id_rsa)是不可靠的，就无法正常使用SSH登陆了。

同时在服务端会有一个~/.ssh/authorized_keys文件，里面存放了多个客户端的公钥Public Key(id_rsa.pub)，就表示拥有这些Public Key的客户端就可以通过SSH登陆服务端。

### SSH公钥登陆过程

1. 客户端发出公钥登陆的请求(ssh user@host)
2. 服务端返回一段随机字符串
3. 客户端用私钥Private Key(id_rsa)加密这个字符串，再发送回服务端
4. 服务端用~/.ssh/authorized_keys里面存储的公钥Public Key去解密收到的字符串。如果成功，就表明这个客户端是可信的，客户端就可以成功登陆

由此可见，只要多台电脑上的的公钥Public Key(id_rsa.pub)和私钥Private Key(id_rsa)是一样的，对于服务端来说着其实就是同一个客户端。所以可以通过复制公钥Public Key(id_rsa.pub)和私钥Private Key(id_rsa)到多台电脑来实现共享登陆。

这里也需要强调的是，一定要确保公钥Public Key(id_rsa.pub)和私钥Private Key(id_rsa)的安全，不要随意乱扔，乱扔它会污染环境，砸到小朋友怎么办？就算砸不到小朋友砸到花花草草也不好嘛！
Keep SSH Public/Private Keys Safe