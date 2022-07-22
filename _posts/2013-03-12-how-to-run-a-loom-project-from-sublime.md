---
id: 177
title: How to run a loom project from sublime?
date: 2013-03-12T02:47:32+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=177
permalink: /how-to-run-a-loom-project-from-sublime/
---
[Loom](http://theengine.co/) is a game engine that provides live update functionality which makes testing code very easy. It is slowly gaining popularity at least among the newbie game developers and students (ones like me) as it is free and provides normal developers to take a shot a game development. without too much investment.

As it does not come with any IDE, I tend to use [Sublime Text](http://www.sublimetext.com/) for development with loom. If you are doing the same, you might need some build system to build+run loom from within Sublime. Below I am sharing the steps that I took to achieve the same. Although I am using Windows for my example, you can use any OS to achieve the same with appropriate changes. Here it is:

Go to `Tool > Build System > New Build System...`

Then add the following code to the build script that you get

`{<br />
"cmd": ["loom.bat", "run"],<br />
"selector": "source.ls",<br />
"path": "C:\\Program Files (x86)\\Loom\\bin"<br />
}<br />
` 

and save the file in the `Packages` directory.

**Update:**

I recently found [this](https://github.com/ambethia/Sublime-Loom) project that is allows much more than just running a project.