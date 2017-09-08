---
id: 173
title: Dealing with missing headers and files on Debian when compiling software and libraries.
date: 2013-03-07T08:20:56+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=173
permalink: /dealing-with-missing-headers-and-files-on-debian-when-compiling-software-and-libraries/
categories:
  - Linux
tags:
  - missing headers
  - missing libraries
---
If you are using any Debian-based OS like Ubuntu for some time, it is possible that you might have tried to compile some library or software and encountered the same old error like this

> fatal error: xyz.h: No such file or directory 

At this time, you are really pissed off as you do not know where to find this header. Now, first you will try to google it and if you are not lucky (which happens with me a lot), you will not find any useful thing. However, I recently discovered that at this point too, there is some hope left.

If the header belongs to some Debian package, you can use _apt-file_ tool to find which package it belongs to. To do this, first install _apt-file_.

`sudo aptitude install apt-file`

Then update it using 

`sudo apt-file update`

This will load the relevant information to find what you are looking for. Then do 

`apt-file search xyz.h`

And if it is indeed a header file from a debian package, you by now have gotten the relevant information to install the appropriate package.