---
layout: post
title: know-thy-operator-semantics
date: 2022-10-09 04:08 -0700
---
Whenever I pick a manual for a new language I often skip the first few chapters that introduce operators, conditional, etc. This is
because for the most part these constructs behave the same way for most of the languages that implement them.

This post is a reminder to not ignore those sections. Why? Because different programming languages might implement operator semantics differently. 
And, if you forget about the nuances of the language that you are using, you are inviting pain.

Here is an example to illustrate:

Let's look at integer division. What is `123/10`? It's `12`

![](https://media2.giphy.com/media/aVtdz7iNVPI1W/giphy.gif?cid=ecf05e47lmgggbt2mmih5dx8okclox1a3m8n8b3nprr0kjbd&rid=giphy.gif&ct=g)

How about `-123/10`? If you are coming to Ruby from something like Java or C, you are likely to say `-12`. Well, if you are using Ruby, that is the incorrect answer. The correct answer is `-13`

![](https://media3.giphy.com/media/11ahZZugJHrdLO/giphy.gif?cid=ecf05e478oeb7kbwp2t0xq01pm31tafezgwpujyclhcilmb2&rid=giphy.gif&ct=g)

At this point, you are probably thinking that this is a bug in the language. Well, no!! Because, Ruby implements a different semantics for `/` operator than Java, and although they look
same syntactically, they mean different things.

Similarly, if you are trying to find the remainder of a negative number, the semantics for `%` is different in Ruby vs Java. For example, in Ruby `-12%10` is `8` and not `-2` like Java. If you want the Java-like
behaviour, you will have to use `-12.remainder(10)`, which returns `-2`

The moral of the story: don't assume what an operator means when you are picking a new language. Happy coding!