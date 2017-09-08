---
id: 201
title: Using switch-case for String in Java6
date: 2013-05-23T19:59:34+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=201
permalink: /using-switch-case-for-string-in-java6/
wp-syntax-cache-content:
  - |
    a:4:{i:1;s:1721:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="java" style="font-family:monospace;">&nbsp;
    <span style="color: #000000; font-weight: bold;">if</span><span style="color: #009900;">&#40;</span>str.<span style="color: #006633;">equals</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;Opt1&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    ...
    <span style="color: #009900;">&#125;</span><span style="color: #000000; font-weight: bold;">else</span> <span style="color: #000000; font-weight: bold;">if</span><span style="color: #009900;">&#40;</span>str.<span style="color: #006633;">equals</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;Opt2&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    ...
    <span style="color: #009900;">&#125;</span><span style="color: #000000; font-weight: bold;">else</span> <span style="color: #000000; font-weight: bold;">if</span><span style="color: #009900;">&#40;</span>str.<span style="color: #006633;">equals</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;Opt3&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    ...
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">
    if(str.equals(&quot;Opt1&quot;)){
    ...
    }else if(str.equals(&quot;Opt2&quot;)) {
    ...
    }else if(str.equals(&quot;Opt3&quot;)){
    ...
    }</p></div>
    ;i:2;s:1010:
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="java" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">switch</span><span style="color: #009900;">&#40;</span>str<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">case</span> <span style="color: #0000ff;">&quot;Opt1&quot;</span><span style="color: #339933;">:</span> ...
    <span style="color: #000000; font-weight: bold;">case</span> <span style="color: #0000ff;">&quot;Opt2&quot;</span><span style="color: #339933;">:</span> ...
    <span style="color: #000000; font-weight: bold;">case</span> <span style="color: #0000ff;">&quot;Opt3&quot;</span><span style="color: #339933;">:</span> ...
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">switch(str){
    case &quot;Opt1&quot;: ...
    case &quot;Opt2&quot;: ...
    case &quot;Opt3&quot;: ...
    }</p></div>
    ;i:3;s:412:
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="java" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">enum</span> Options<span style="color: #009900;">&#123;</span>
    Opt1, Opt2, Opt3
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">enum Options{
    Opt1, Opt2, Opt3
    }</p></div>
    ;i:4;s:1657:
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="java" style="font-family:monospace;">Options option <span style="color: #339933;">=</span> Options.<span style="color: #006633;">valueOf</span><span style="color: #009900;">&#40;</span>str<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #000000; font-weight: bold;">switch</span><span style="color: #009900;">&#40;</span>option<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">case</span> OPT1<span style="color: #339933;">:</span> <span style="color: #339933;">&lt;</span>task1<span style="color: #339933;">&gt;;</span> <span style="color: #000000; font-weight: bold;">break</span><span style="color: #339933;">;</span>
    <span style="color: #000000; font-weight: bold;">case</span> OPT2<span style="color: #339933;">:</span> <span style="color: #339933;">&lt;</span>task2<span style="color: #339933;">&gt;;</span> <span style="color: #000000; font-weight: bold;">break</span><span style="color: #339933;">;</span>
    <span style="color: #000000; font-weight: bold;">case</span> OPT3<span style="color: #339933;">:</span> ...<span style="color: #339933;">;</span> <span style="color: #000000; font-weight: bold;">break</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">Options option = Options.valueOf(str);
    switch(option){
    case OPT1: &lt;task1&gt;; break;
    case OPT2: &lt;task2&gt;; break;
    case OPT3: ...; break;
    }</p></div>
    ";}
categories:
  - Java
tags:
  - if-else
  - java 6
  - performance
  - switch-case
---
Until Java 7, developers were not able to use **String** in **switch-case **construct. The only option was to write a huge **if-else **block like this

<pre lang="java">if(str.equals("Opt1")){
...
}else if(str.equals("Opt2")) {
...
}else if(str.equals("Opt3")){
...
}
</pre>

In my opinion, switch-case although somewhat limited than if-else, is a cleaner construct.

With Java 7, one can use String in a switch-case just like an integer:

<pre lang="java">switch(str){
case "Opt1": ...
case "Opt2": ...
case "Opt3": ...
}
</pre>

However, as there is still a substantial amount of Java 6 development, I thought I would share a cleaner alternative for conditionals involving **String**. However, this alternative is applicable only for cases where the existing conditionals use `equals()` method. Suppose you have an if-else block like the one shown above, then you can convert it into a switch-case construct like this:

First, define an Enum containing all the options

<pre lang="java">enum Options{
 Opt1, Opt2, Opt3
}
</pre>

Then replace the if-else by switch-case like this:

<pre lang="java">Options option = Options.valueOf(str);
switch(option){
case OPT1: &lt;task1>; break;
case OPT2: &lt;task2>; break;
case OPT3: ...; break;
}
</pre>

**Update:**
  
However, the switch-case alternative although cleaner, might appear slower in some cases. If the time taken by the tasks **(taks1, task2 etc&#8230;)** is very small compared to **Options.valueOf()** then the switch-case would appear slower as the **valueOf** method does several complex operations to return the correct enum.

If you would like to compare performance difference between the two alternatives, I have written a simple test available [here](https://gist.github.com/gupta-ankit/5638955).