---
id: 158
title: What is the fastest way to find if a number is prime?
date: 2013-03-01T04:18:19+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=158
permalink: /what-is-the-fastest-way-to-find-if-a-number-is-prime/
tags: java
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