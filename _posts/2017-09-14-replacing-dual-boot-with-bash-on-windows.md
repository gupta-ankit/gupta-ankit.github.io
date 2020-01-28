---
title: 'Replacing dual boot with Bash on Windows'
date: 2017-09-14T10:12:09+00:00
layout: post
author: Ankit Gupta
tags: windows, dual-boot, bash-on-windows
categories:
  - Software Review
tags:
  - dual-boot
  - WSL
  - bash
---

For most of my career, I have found a computer with dual boot setup &#8212;  Windows and Ubuntu &#8212; to be an essential component. I use Ubuntu for all the software development and Windows for editing word documents, working with Adobe products, and playing games (something which is still largely absent from Linux distributions). Until recently, I have found that writing code on Ubuntu to be very efficient. Compared to when I was using Windows along, it saves me a lot of time wasted in trying to get some compiler/framework to work and dealing with incompatibility issues on Windows. A simple apt-get install on my Ubuntu machine goes a long. The only drawback of this setup is that I have to switch between the two operating systems. I cannot switch to a short burst of gaming and get back to work. But, that never became a huge issue.

Everything was running smoothly, until recently, when I bought myself a Lenovo Yoga 900. It is a great laptop with only one drawback: configuring it for a dual boot setup is a pain. I was unable to do so. I was unable to do any software development on my laptop. Thankfully, I had access to a Ubuntu desktop in my office, and I was able to continue my development work there. It was not very comfortable. I was unable to work from home. I spent about six months or so and the only thing I can say about that: It was not fun!

All my troubles, however, came to an end when I got hands on the Bash on Windows. I understand that it is still only available for those who opt-in the Windows Insider program to get early access. Nevertheless, I have it, and I just love it! Thank you, Microsoft. I must admit though that my initial reactions when Microsoft announced the project were not very optimistic. I have used Wine on Linux, and Cygwin on Windows before. Using these products was frustrating and not very user-friendly. I expected Bash on Windows to have a similar experience. However, given the impossibility of dual-boot on my laptop, I was motivated enough to give it a try. I did give it a try and was quite impressed. Installing libraries and frameworks was efficient again. In fact, it is better than the previous experience of using a dual boot system. For the most part, I do not feel the need to use Ubuntu OS. BoW suffices most of my needs, and when I feel the need to open multiple bash tabs, I simply use tmux.

I am a big fan of BoW. I welcome the efforts put by the Canonical-Microsoft team. One thing is for sure, users who switched from Windows/Linux to Mac so that they can use things like Photoshop while using a Unix environment, and had to compromise on the hardware-to-cost ratio will have more incentive to return to Windows. BoW has made Windows a viable option for developers, particularly those who develop using PHP and Ruby.
