---
id: 102
title: How to get the calling class name from the static method of the superclass in Java?
date: 2012-12-12T00:20:11+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=102
permalink: /how-to-get-the-calling-class-name-from-the-static-method-of-the-superclass-in-java/
categories:
  - Java
tags:
  - Java
  - java reflection
---
<p style="text-align: justify;">
  While coding Java for one of my projects, I came across a  weird requirement. I had a super class that had a static method and I wanted to know the name of the sub classes of my super class that called the method. Let me explain that by example.
</p>

<!--more-->

<p style="text-align: justify;">
  I have a class <code>Super</code> that contains a static method <code>superStaticMethod()</code> that prints the name of the class.
</p>

<pre lang="java" line="1">package example;

/** Super.java **/
public class Super {

	/** prints the name of the calling class **/
	public static void aStaticMethod() {
		System.err.println("Super static method called from " + getClassName());
	}

	private static String getClassName() {
		return Super.class.getName();
	}

}
</pre>

Now I have another class `Sub` that extends the `Super` class.

<pre lang="java">package example;

/** Sub.java **/
public class Sub extends Super {
	// nothing here.
}
</pre>

<p style="text-align: justify;">
  Now, whether I call <code>Super.aStaticMethod()</code> or <code>Sub.aStaticMethod()</code>, I will get the same output :
</p>

> Super static method called from example.Super

<p style="text-align: justify;">
  This is precisely because <code>Super</code> class has no idea of which class actually called the method. Had this been a simple instance method, it was simple. I can just use <code>this.class.getName()</code>. But achieving the same effect is tricky because there is no instance involved when calling the static method and calling <code>Sub.aStaticMethod()</code> is same as calling <code>Super.aStaticMethod()</code>.
</p>

<p style="text-align: justify;">
  However, after battling with reflection, I found some way which I would like to share. Here is how its done. The trick is that you hide inside the <code>Super</code> class a spy that can tell you who called the method. This spy will actually be a nested static class that will reveal the details of the calling class.
</p>

<p style="text-align: justify;">
  What you need to do is modify the <code>Super</code> class to this:
</p>

<pre lang="java">package example2;

public class Super {

	public static void aStaticMethod() {
		System.err.println("Super static method called from "
				+ new Spy().revealTheCallingClass());
	}

	/** This class helps get the class name */
	static class Spy extends SecurityManager {

		public String revealTheCallingClass() {
			Class[] classes = getClassContext();
			for (Class cls : classes) {
				// check if the class is a sub class and its the Super class
				// itself.
				if (Super.class.isAssignableFrom(cls) && cls != Super.class) {
					return cls.getName();
				}
			}

			return null;
		}
	}

}

</pre>

Now if you modify the class for Sub to

<pre lang="java">package example2;

public class Sub extends Super{

  public static void useSuperClassName(){
    aStaticMethod();
  }
}
</pre>

<p style="text-align: justify;">
  Calling <code>Sub.useSuperClassName()</code> will print <strong>example2.Sub</strong>. Note however that calling <strong>Sub.aStaticMethod()</strong> will still print null or the name of the class in which it is called (if that class is a subclass of Super) which is something that I will try to rectify in future, if possible.
</p>
