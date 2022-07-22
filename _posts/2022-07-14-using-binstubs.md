---
layout: post
title: Improve CLI experience of Ruby projects with binstubs
date: 2022-07-14 01:08 -0700
tags: ruby bundle binstubs
---
If you are like me, working on multiple Ruby projects with different versions of the same gems installed, you must be familiar with `bundle exec` for picking the correct gem version.

Using `bundle exec` every time I want to run something like `rspec` can get tedious. Fortunately, there is a better way — binstubs. Binstubs are scripts that wrap executables. Bundler allows you to create these executables via

```
bundle binstubs <gem_name>
```

For example, I use `jekyll` for creating static websites (including this one). Instead of running `bundle exec jekyll` every time, I can generate a binstub. Here is what I do:

First, generate the binstub

```
bundle binstub jekyll
```

This creates a binstub at `./bin/jekyll`. Now, I can run `./bin/jekyll` instead of `bundle exec jekyll`. This is shorter and faster, but just not enough. Let's make it even better. I can update the PATH variable so that my shell always looks for executables first in the local `bin` sub-directory. I add the following line in my `.bashrc` file:

```
export PATH=./bin:$PATH
```

Now, every time I want to run jekyll, I can simple type `jekyll`, and the correct version of jekyll would run. No more `bundle exec jekyll`. 

Now, your turn! Try doing the same for rspec (or any other gem that you use all the time) in your Ruby projects.
