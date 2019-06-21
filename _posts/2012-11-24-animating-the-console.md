---
id: 76
title: Animating the console!
date: 2012-11-24T20:34:16+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=76
wp-syntax-cache-content:
  - |
    a:1:{i:1;s:7124:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="line_numbers"><pre>1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23
    24
    25
    26
    27
    28
    29
    30
    31
    32
    33
    34
    35
    36
    </pre></td><td class="code"><pre class="java" style="font-family:monospace;"><span style="color: #008000; font-style: italic; font-weight: bold;">/**
    * MarqueeOnConsole.java
    * Following piece of code available to use without any fee for any closed/open-source project.
    * Creates a HTML-marquee-like text on console.
    *
    * @author Ankit Gupta
    * @version 1.0
    */</span>
    <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">class</span> MarqueeOnConsole<span style="color: #009900;">&#123;</span>
    &nbsp;
    <span style="color: #008000; font-style: italic; font-weight: bold;">/** Width of the marquee in terms of character. **/</span>
    <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">static</span> <span style="color: #000000; font-weight: bold;">final</span> <span style="color: #000066; font-weight: bold;">int</span> CONSOLE_LENGTH<span style="color: #339933;">=</span><span style="color: #cc66cc;">40</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #008000; font-style: italic; font-weight: bold;">/** Creates a rolling marquee on console. **/</span>
    <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">static</span> <span style="color: #000066; font-weight: bold;">void</span> main<span style="color: #009900;">&#40;</span><span style="color: #003399;">String</span> <span style="color: #009900;">&#91;</span><span style="color: #009900;">&#93;</span>agrs<span style="color: #009900;">&#41;</span> <span style="color: #000000; font-weight: bold;">throws</span> <span style="color: #003399;">InterruptedException</span><span style="color: #009900;">&#123;</span>
    <span style="color: #003399;">String</span> text <span style="color: #339933;">=</span> <span style="color: #0000ff;">&quot;This text is rolling!&quot;</span><span style="color: #339933;">;</span>
    <span style="color: #000066; font-weight: bold;">int</span> prefixLength<span style="color: #339933;">=-</span><span style="color: #cc66cc;">1</span><span style="color: #339933;">;</span>
    <span style="color: #000000; font-weight: bold;">while</span><span style="color: #009900;">&#40;</span><span style="color: #000066; font-weight: bold;">true</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #003399;">String</span> prefix <span style="color: #339933;">=</span> <span style="color: #0000ff;">&quot;<span style="color: #000099; font-weight: bold;">\r</span>&quot;</span><span style="color: #339933;">;</span>
    prefixLength<span style="color: #339933;">++;</span>
    <span style="color: #000000; font-weight: bold;">if</span><span style="color: #009900;">&#40;</span>prefixLength<span style="color: #339933;">&amp;</span>gt<span style="color: #339933;">;</span>CONSOLE_LENGTH<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    prefixLength<span style="color: #339933;">=</span><span style="color: #cc66cc;">0</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #000000; font-weight: bold;">for</span><span style="color: #009900;">&#40;</span><span style="color: #000066; font-weight: bold;">int</span> i<span style="color: #339933;">=</span><span style="color: #cc66cc;">0</span><span style="color: #339933;">;</span> i <span style="color: #339933;">&amp;</span>lt<span style="color: #339933;">;</span> prefixLength<span style="color: #339933;">;</span>i<span style="color: #339933;">++</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    prefix <span style="color: #339933;">+=</span> <span style="color: #0000ff;">&quot; &quot;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #000066; font-weight: bold;">int</span> endIndex <span style="color: #339933;">=</span> CONSOLE_LENGTH<span style="color: #339933;">-</span>prefixLength<span style="color: #339933;">;</span>
    <span style="color: #000000; font-weight: bold;">if</span><span style="color: #009900;">&#40;</span>endIndex <span style="color: #339933;">&amp;</span>gt<span style="color: #339933;">;</span> text.<span style="color: #006633;">length</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    endIndex <span style="color: #339933;">=</span> text.<span style="color: #006633;">length</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #003399;">String</span> printableText <span style="color: #339933;">=</span> text.<span style="color: #006633;">substring</span><span style="color: #009900;">&#40;</span><span style="color: #cc66cc;">0</span>,endIndex<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #003399;">System</span>.<span style="color: #006633;">out</span>.<span style="color: #006633;">print</span><span style="color: #009900;">&#40;</span>prefix <span style="color: #339933;">+</span> printableText<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #003399;">Thread</span>.<span style="color: #006633;">sleep</span><span style="color: #009900;">&#40;</span><span style="color: #cc66cc;">100</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">/**
    * MarqueeOnConsole.java
    * Following piece of code available to use without any fee for any closed/open-source project.
    * Creates a HTML-marquee-like text on console.
    *
    * @author Ankit Gupta
    * @version 1.0
    */
    public class MarqueeOnConsole{
    
    /** Width of the marquee in terms of character. **/
    public static final int CONSOLE_LENGTH=40;
    
    /** Creates a rolling marquee on console. **/
    public static void main(String []agrs) throws InterruptedException{
    String text = &quot;This text is rolling!&quot;;
    int prefixLength=-1;
    while(true){
    String prefix = &quot;\r&quot;;
    prefixLength++;
    if(prefixLength&amp;gt;CONSOLE_LENGTH){
    prefixLength=0;
    }
    for(int i=0; i &amp;lt; prefixLength;i++){
    prefix += &quot; &quot;;
    }
    int endIndex = CONSOLE_LENGTH-prefixLength;
    if(endIndex &amp;gt; text.length()){
    endIndex = text.length();
    }
    String printableText = text.substring(0,endIndex);
    System.out.print(prefix + printableText);
    Thread.sleep(100);
    }
    }
    }</p></div>
    ";}
categories:
  - Java
tags:
  - console
  - fun programming
---
<p style="text-align: justify;">
  There are times when I love to use command-line/terminal (whatever you want to call it). And when I do I like to do something fun with it, and not just putting text to read. This post contains two examples of some fun code that you might wanna use to make something nice of your command-line application.
</p>

<p style="text-align: justify;">
  The first example is a rolling piece of text on console (something similar to what you might get from the HTML marquee.
</p>

[<img class="alignnone  wp-image-28" title="MarqueeOnConsole" alt="" src="/uploads/2012/11/MarqueeOnConsole1.gif" />](/uploads/2012/11/MarqueeOnConsole1.gif)

<pre lang="java" line="1">/**
* MarqueeOnConsole.java
* Following piece of code available to use without any fee for any closed/open-source project.
* Creates a HTML-marquee-like text on console.
*
* @author Ankit Gupta
* @version 1.0
*/
public class MarqueeOnConsole{

	/** Width of the marquee in terms of character. **/
	public static final int CONSOLE_LENGTH=40;

	/** Creates a rolling marquee on console. **/
	public static void main(String []agrs) throws InterruptedException{
		String text = "This text is rolling!";
		int prefixLength=-1;
		while(true){
			String prefix = "\r";
			prefixLength++;
			if(prefixLength&gt;CONSOLE_LENGTH){
				prefixLength=0;
			}
			for(int i=0; i &lt; prefixLength;i++){
				prefix += " ";
			}
			int endIndex = CONSOLE_LENGTH-prefixLength;
			if(endIndex &gt; text.length()){
				endIndex = text.length();
			}
			String printableText = text.substring(0,endIndex);
			System.out.print(prefix + printableText);
			Thread.sleep(100);
		}
	}
}</pre>

<p style="text-align: justify;">
  This second example is the one that simulates the process completion that you see on console with increasing percent.
</p>

<p style="text-align: justify;">
  <p style="text-align: justify;">
    <a href="/uploads/2012/11/AnimatedConsole.gif"><img class="alignnone size-full wp-image-49" alt="AnimatedConsole" src="/uploads/2012/11/AnimatedConsole.gif"   height="330" srcset="/uploads/2012/11/AnimatedConsole.gif 860w, /uploads/2012/11/AnimatedConsole-300x115.gif 300w, /uploads/2012/11/AnimatedConsole-500x191.gif 500w" sizes="(max-width: 860px) 100vw, 860px" /></a>
  </p>
  
  <p style="text-align: justify;">
    The key in both the example here is the use of &#8220;\r&#8221; (carriage return character). What it does is that it moves the cursor to the front of the current-line without moving it down (like &#8220;\n&#8221;).
  </p>
  
  <p style="text-align: justify;">
    Although, this is not something awesome but still something that might help you make your command-line tool or application look pretty.
  </p>
  
  <p style="text-align: justify;">
    If you have done some nice effect in your text-based console app, I would like to have a look at it. Send me an email or leave a reply here.
  </p>