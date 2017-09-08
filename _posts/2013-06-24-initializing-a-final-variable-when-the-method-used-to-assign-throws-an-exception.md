---
id: 320
title: Initializing a final variable when the method used to assign throws an exception.
date: 2013-06-24T14:24:03+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=320
permalink: /initializing-a-final-variable-when-the-method-used-to-assign-throws-an-exception/
wp-syntax-cache-content:
  - |
    a:2:{i:1;s:3173:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="java" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">class</span> Foo<span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">private</span> Foo<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span><span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">static</span> Foo createFoo<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span> <span style="color: #000000; font-weight: bold;">throws</span> <span style="color: #003399;">Exception</span><span style="color: #009900;">&#123;</span>
    &nbsp;
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #000000; font-weight: bold;">class</span> Bar<span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">private</span> <span style="color: #000000; font-weight: bold;">final</span> Foo foo<span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">//This will not work. It will give the error &quot;variable foo might not have been initialized.</span>
    <span style="color: #000000; font-weight: bold;">public</span> Bar<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">try</span><span style="color: #009900;">&#123;</span>
    foo <span style="color: #339933;">=</span> Foo.<span style="color: #006633;">createFoo</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span><span style="color: #000000; font-weight: bold;">catch</span><span style="color: #009900;">&#40;</span><span style="color: #003399;">Exception</span> e<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #003399;">System</span>.<span style="color: #006633;">err</span>.<span style="color: #006633;">println</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;foo cannot be initialized&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">class Foo{
    private Foo(){}
    
    public static Foo createFoo() throws Exception{
    
    }
    }
    
    class Bar{
    private final Foo foo;
    
    //This will not work. It will give the error &quot;variable foo might not have been initialized.
    public Bar(){
    try{
    foo = Foo.createFoo();
    }catch(Exception e){
    System.err.println(&quot;foo cannot be initialized&quot;);
    }
    }
    }</p></div>
    ;i:2;s:2521:
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="java" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">class</span> Bar<span style="color: #009900;">&#123;</span>
    ...
    <span style="color: #000000; font-weight: bold;">public</span> Bar<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    foo <span style="color: #339933;">=</span> createFooWrapper<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #000000; font-weight: bold;">private</span> Foo createFooWrapper<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">try</span><span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">return</span> Foo.<span style="color: #006633;">createFoo</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span><span style="color: #000000; font-weight: bold;">catch</span><span style="color: #009900;">&#40;</span><span style="color: #003399;">Exception</span> e<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #003399;">System</span>.<span style="color: #006633;">err</span>.<span style="color: #006633;">println</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;foo cannot be initialized&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #000000; font-weight: bold;">return</span> <span style="color: #000066; font-weight: bold;">null</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">class Bar{
    ...
    public Bar(){
    foo = createFooWrapper();
    }
    
    private Foo createFooWrapper(){
    try{
    return Foo.createFoo();
    }catch(Exception e){
    System.err.println(&quot;foo cannot be initialized&quot;);
    }
    return null;
    }
    }</p></div>
    ";}
categories:
  - Java
tags:
  - sample-code
  - tutorial
---
<p style="text-align: justify;">
  A good design principle is to make a variable final whenever possible. However, following this principle can sometimes be tricky. One such case is when the variable/field is initialized with return of a function that throws exception. Let me explain using an example. Suppose, you have classes <strong>Foo</strong> and <strong>Bar </strong>as follows:
</p>

<pre lang="java">class Foo{
  private Foo(){}

  public static Foo createFoo() throws Exception{

  } 
}

class Bar{
  private final Foo foo;

  //This will not work. It will give the error "variable foo might not have been initialized.
  public Bar(){
     try{
      foo = Foo.createFoo();
     }catch(Exception e){
      System.err.println("foo cannot be initialized");
     }
  }
}</pre>

<p style="text-align: justify;">
  As you can see that the variable <em>foo, </em>in a <strong>Bar </strong>object is final. Function <em>createFoo() </em>creates a <strong>Foo</strong> object. As this method can throw an exception, the code for class <strong>Bar </strong>will not compile, raising an error &#8220;<span style="color: #ff0000;">variable foo might not have been initialized.</span>&#8220;
</p>

<p style="text-align: justify;">
  <span style="color: #000000;">The problem is that the compiler has no way of making sure that the variable <em>foo</em> will be assigned after the constructor for <strong>Bar</strong> finishes (<em>foo </em>will not be initialized if <em>createFoo() </em>throws an exception). How can you solve this compilation error?</span>
</p>

<p style="text-align: justify;">
  Here is how: Write another function that wraps call to the function <em>createFoo() </em>and the associated exception handling.
</p>

&nbsp;

<pre lang="java">class Bar{
  ...
  public Bar(){
      foo = createFooWrapper();
  }

  private Foo createFooWrapper(){
     try{
      return Foo.createFoo();
     }catch(Exception e){
      System.err.println("foo cannot be initialized");
     }
     return null;
  }
}</pre>

<p style="text-align: justify;">
  In case the exception occurs, <em>foo </em>will be null, else it would be what <em>createFoo() </em> returns.
</p>