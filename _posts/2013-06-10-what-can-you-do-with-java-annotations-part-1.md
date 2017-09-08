---
id: 257
title: 'What can you do with Java annotations? &#8211; Part 1'
date: 2013-06-10T23:54:19+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=257
permalink: /what-can-you-do-with-java-annotations-part-1/
wp-syntax-cache-content:
  - |
    a:1:{i:1;s:563:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="java" style="font-family:monospace;">@Override
    <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000066; font-weight: bold;">void</span> myMethod<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    ...
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">@Override
    public void myMethod(){
    ...
    }</p></div>
    ";}
categories:
  - Java
tags:
  - annotations
  - Java
  - java reflection
---
Java 5.0 introduced annotations among many things. Annotations are a way of adding metadata to Java elements such as _classes, methods, variables, parameters_ and _packages._ An annotation in its simplest form looks something like this:

<p style="padding-left: 30px;">
  <code>@MyAnnotation</code>
</p>

<p style="text-align: justify;">
  The &#8216;@&#8217; character means that what follows is an annotation. One of the uses of annotations is to generate boiler code. However, they can be used in several interesting ways. Java defines certain built-in annotations such as <em>@Override </em>and <em>@Deprecated</em>. @Override is used to annotate methods that are overridden. When annotated the compiler makes sure that the method is actually overriding a method, else compilation will fail. For example, the following code annotates a method <em>myMethod()</em> with @<em>Override. </em>When this code compiles, the compiler ensures that <em>myMethod() </em>is actually overridden.
</p>

<pre lang="java">@Override
public void myMethod(){
...
}</pre>

<p style="text-align: justify;">
  You might be wondering what do we gain by @Override? Assuming that we do not have annotations, if while overriding <em>myMethod()</em>, I misspell it to be <em>yourMethod(), </em>the compiler will not generate any error. It will consider it to be just another method and detecting such a bug can be a bloody business. So, you can see how useful can a simple annotation be. But, that is not all. As we mentioned earlier, annotations can be used for much more amazing stuff. One of my favourites is <strong><a href="https://sites.google.com/site/deucestm/">Deuce STM</a>. </strong>Software Transactional Memory is one of the several ways of developing concurrent applications in a clean fashion. Deuce STM  provides support for STM via a &#8220;java agent&#8221; and @<em>Atomic </em>annotation.
</p>

<p style="text-align: justify;">
  Annotations are a very interesting feature and there is a lot to annotations which you can know by reading the <a href="http://docs.oracle.com/javase/tutorial/java/annotations/index.html">Oracle documentation</a> to read more. The purpose of this post is not to rewrite what is already there. Rather I would like to show you in the <a title="What can you do with Java annotations? – Part 2" href="http://www.ankit-gupta.com/what-can-you-do-with-java-annotations-part-2/">next post</a>, an interesting way to use annotations to implement a plugin-like structure to your application.
</p>