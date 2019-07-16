---
id: 264
title: 'What can you do with Java annotations? &#8211; Part 2'
date: 2013-06-11T14:30:26+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=264
permalink: /what-can-you-do-with-java-annotations-part-2/
categories:
  - Java
tags:
  - annotations
  - Java
  - java reflection
---
<p style="text-align: justify;">
  In the <a title="What can you do with Java annotations? – Part 1" href="http://www.ankit-gupta.com/what-can-you-do-with-java-annotations-part-1/">previous post</a> I briefly wrote about Java annotations and some of their uses. There is plenty of documentation about syntax and features online and hence I don&#8217;t want to write about it again.
</p>

<!--more-->

<p style="text-align: justify;">
  Instead, I will be showing how you can use annotations for something simple but useful. Consider the following scenario:
</p>

> <p style="text-align: justify;">
>   You are working on an application that has a menu. Each of the items in that menu implements an interface (with certain methods). You have several classes that implement that interface. However, you only want certain menu items to be displayed in the menu. In addition, you might also want to change the positioning of the menu items.
> </p>

<p style="text-align: justify;">
  To keep the example simple, we will consider a simple console based menu. You might start with something like this:
</p>

<pre lang="java">public interface MyPlugin{
 public String getName();
}</pre>

<pre lang="java">...
public static void main(String []args){
  MyPlugin plugin1 = new PluginA();
  MyPlugin plugin2 = new PluginB();
  MyPlugin plugin3 = new PluginC();

  List plugins = new ArrayList();
  plugins.add(plugin1);
  plugins.add(plugin2);
  plugins.add(plugin3);

  for(int i =0; i&lt;plugins.size(); i++){
    System.out.println(i + "  " + plugins.get(i).getName());
  }
}
...</pre>

This is all good, except that whenever you want to hide a menu item or change its position, you will be required to make changes to the main application code. This is something you should try to avoid when the main application code is much more complex than just printing Strings. In fact, you might not even have the opportunity to change the main code, if you are trying to extend an existing application. Hence a better way would be what is called [Dependency Injection](http://en.wikipedia.org/wiki/Dependency_injection). One way to do that in Java is using _annotation_. Let's see what it looks like:

First we define the interface for items:

<pre lang="java">public interface MyPlugin {
	public String getName();
}</pre>

Next we define the annotation that will be used to make the plugin visible and specify its position.

<pre lang="java">@Retention(RetentionPolicy.RUNTIME)
public @interface MyPluginAnnotation {
	int position();
}</pre>

<p style="text-align: justify;">
  As you can see the declaration looks similar to that of an interface, except that we use <strong>@</strong> symbol in front of interface. There is a new annotation that you might not have seen before. @<em>Retention </em>is an annotation that can be added to your annotation. It tells the compiler the how the newly defined annotation is to be stored. <em>RetentionPolicy.RUNTIME </em>tells the compiler that this annotation should be available at runtime. This is required in our case as we will be using the annotations at runtime to decide the position and visibility of plugins.
</p>

<p style="text-align: justify;">
  Next <code>int position()</code> declares an element of the annotation called <em>position </em>of type <em>int. </em>Let's use it for our first plugin.
</p>

<pre lang="java">@MyPluginAnnotation(position = 0)
public class PluginA implements MyPlugin{

  @Override
  public String getName() {
    return "Menu Item A";
  }
}
</pre>

The only new piece of code is

<pre lang="java">@MyPluginAnnotation(position = 0)</pre>

Here you can see that the annotation assigns a value of 0 to the position element. Similarly we can define another one with position 1.

<pre lang="java">@MyPluginAnnotation(position = 1)
public class PluginB implements MyPlugin{

  @Override
  public String getName() {
    return "Menu Item B";
  }
}</pre>

Now, let's see how we can use them:

<pre lang="java">public class Main {
  public static void main(String[] args) {
    Main main = new Main();
    Map&lt;Integer, MyPlugin> pluggedInMenuItems = main.loadPlugins();
    Set keySet = pluggedInMenuItems.keySet();

    List positions = new ArrayList(keySet);
    Collections.sort(positions);

    for(Integer i : positions){
       System.out.println(i + "   " + pluggedInMenuItems.get(i).getName());
    }
}

private Map&lt;Integer, MyPlugin> loadPlugins() {
  Map&lt;Integer, MyPlugin> positionMap = new HashMap&lt;Integer, MyPlugin>();
  //find classes that implement the given interface.
  Reflections reflections = new Reflections("");
  Set&lt;Class<? extends MyPlugin>> subTypesOf = reflections.getSubTypesOf(MyPlugin.class);

  for (Class

<? extends MyPlugin> c : subTypesOf) {
    MyPluginAnnotation annotation = c.getAnnotation(MyPluginAnnotation.class);
    // only add the plugin to the position map if it is annotated
    if (annotation != null) {
      try {
         //use the position element of annotation to put the plugin instance at the right position.
         positionMap.put(annotation.position(), c.newInstance());
      } catch (InstantiationException e) {
         System.err.println("Plugin instantiation failed. Make sure that the plugin has a contructor without any arguments.");
      } catch (IllegalAccessException e) {
         e.printStackTrace();
      }
    }
  }

  return positionMap;
}

}</pre>

<p style="text-align: justify;">
  This code contains the <strong>loadPlugins()</strong> method which makes use of the annotation and its <em>position</em> element to return a map that maps the position to corresponding instance of the plugin. <strong>loadPlugins() </strong>uses the <a href="https://code.google.com/p/reflections/">Reflections</a> library to do find classes. Once it finds all the classes that implement the interface, it finds just the ones with the <em>MyPluginAnnotation </em>annotation to put the instance of the plugin with appropriate position. Finally the <strong>main()</strong> method prints the menu. Now, you can add to the menu any number of items without changing code in the main method.
</p>

<p style="text-align: justify;">
  There are many frameworks like <em>Netbeans</em> and <em>Spring</em> that allow developers to use annotations for dependency injection and if you have worked with any of them before, now you know <em>how it works!</em>
</p>

<p style="text-align: justify;">
  <strong>NOTE: Complete code for this example is available at <a href="https://github.com/gupta-ankit/JavaAnnotationExample">github</a>.</strong>
</p>
