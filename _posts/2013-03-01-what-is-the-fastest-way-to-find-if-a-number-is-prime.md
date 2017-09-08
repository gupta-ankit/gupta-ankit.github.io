---
id: 158
title: What is the fastest way to find if a number is prime?
date: 2013-03-01T04:18:19+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=158
permalink: /what-is-the-fastest-way-to-find-if-a-number-is-prime/
wp-syntax-cache-content:
  - |
    a:1:{i:1;s:4843:"
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
    </pre></td><td class="code"><pre class="java" style="font-family:monospace;"><span style="color: #000066; font-weight: bold;">boolean</span> isPrime<span style="color: #009900;">&#40;</span><span style="color: #000066; font-weight: bold;">long</span> number<span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">if</span> <span style="color: #009900;">&#40;</span>number <span style="color: #339933;">==</span> <span style="color: #cc66cc;">2</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">return</span> <span style="color: #000066; font-weight: bold;">true</span><span style="color: #339933;">;</span> <span style="color: #666666; font-style: italic;">// 2 is a prime</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// if the number is even</span>
    <span style="color: #000000; font-weight: bold;">if</span> <span style="color: #009900;">&#40;</span>number <span style="color: #339933;">%</span> <span style="color: #cc66cc;">2</span> <span style="color: #339933;">==</span> <span style="color: #cc66cc;">0</span> <span style="color: #339933;">||</span> number <span style="color: #339933;">&amp;</span>lt<span style="color: #339933;">;</span> <span style="color: #cc66cc;">1</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">return</span> <span style="color: #000066; font-weight: bold;">false</span><span style="color: #339933;">;</span> <span style="color: #666666; font-style: italic;">// not a prime.</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// a number would be prime if it is not divisible by a number less than or equal to its square root.</span>
    <span style="color: #000066; font-weight: bold;">double</span> root <span style="color: #339933;">=</span> <span style="color: #003399;">Math</span>.<span style="color: #006633;">sqrt</span><span style="color: #009900;">&#40;</span>number<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">//we start the loop from 3 (2 is already checked above)</span>
    <span style="color: #666666; font-style: italic;">//Additionally, we will increment i by 2 as checking for even divisor is not required at this point.</span>
    <span style="color: #000000; font-weight: bold;">for</span> <span style="color: #009900;">&#40;</span><span style="color: #000066; font-weight: bold;">double</span> i <span style="color: #339933;">=</span> <span style="color: #cc66cc;">3</span><span style="color: #339933;">;</span> i <span style="color: #339933;">&amp;</span>lt<span style="color: #339933;">;=</span> root<span style="color: #339933;">;</span> i <span style="color: #339933;">=</span> i <span style="color: #339933;">+</span> <span style="color: #cc66cc;">2</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">if</span> <span style="color: #009900;">&#40;</span>number <span style="color: #339933;">%</span> i <span style="color: #339933;">==</span> <span style="color: #cc66cc;">0</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">return</span> <span style="color: #000066; font-weight: bold;">false</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #000000; font-weight: bold;">return</span> <span style="color: #000066; font-weight: bold;">true</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">boolean isPrime(long number) {
    if (number == 2) {
    return true; // 2 is a prime
    }
    
    // if the number is even
    if (number % 2 == 0 || number &amp;lt; 1) {
    return false; // not a prime.
    }
    
    // a number would be prime if it is not divisible by a number less than or equal to its square root.
    double root = Math.sqrt(number);
    
    //we start the loop from 3 (2 is already checked above)
    //Additionally, we will increment i by 2 as checking for even divisor is not required at this point.
    for (double i = 3; i &amp;lt;= root; i = i + 2) {
    if (number % i == 0) {
    return false;
    }
    }
    
    return true;
    }</p></div>
    ";}
categories:
  - Java
---
<p style="text-align: left;">
  Quoting <a href="http://en.wikipedia.org/wiki/Prime_number">wikipedia</a>,
</p>

> <p style="text-align: left;">
>   A <b>prime number</b> (or a <b>prime</b>) is a <a title="Natural number" href="http://en.wikipedia.org/wiki/Natural_number">natural number</a> greater than 1 that has no positive <a title="Divisor" href="http://en.wikipedia.org/wiki/Divisor">divisors</a> other than 1 and itself.
> </p>

<p style="text-align: left;">
  So, at times you might find a need to check if a number is prime. And if the numbers to be checked for primality, you might need the fastest implementation. In this post, I am sharing the implementation as suggested by the algorithm <a href="http://en.wikipedia.org/wiki/Primality_test">here</a>.
</p>

<pre lang="java" line="1">boolean isPrime(long number) {
	if (number == 2) {
	    return true; // 2 is a prime
	}

	// if the number is even
	if (number % 2 == 0 || number &lt; 1) {
	    return false; // not a prime.
	}

	// a number would be prime if it is not divisible by a number less than or equal to its square root.
	double root = Math.sqrt(number);

	//we start the loop from 3 (2 is already checked above)
	//Additionally, we will increment i by 2 as checking for even divisor is not required at this point.
	for (double i = 3; i &lt;= root; i = i + 2) {
	    if (number % i == 0) {
		return false;
	    }
	}

	return true;
}
</pre>