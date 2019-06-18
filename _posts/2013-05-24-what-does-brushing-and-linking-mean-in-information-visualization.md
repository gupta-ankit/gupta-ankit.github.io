---
id: 211
title: What does brushing and linking mean in information visualization?
date: 2013-05-24T21:06:52+00:00
author: ankit
layout: post
guid: http://www.ankit-gupta.com/?p=211
permalink: /what-does-brushing-and-linking-mean-in-information-visualization/
categories:
  - Visualization
tags:
  - brushing
  - interaction technique
  - linking
---
<p style="text-align: justify;">
  Visualization systems generally consist of several independent visualizations, each allowing exploration of a different aspect of data. Over years, researchers have developed several interaction techniques to allow users to explore data. Two of these several techniques are <strong>Brushing </strong>and <strong>Linking</strong>.
</p>

<p style="text-align: justify;">
  <strong>Brushing</strong> refers to several interaction techniques that allow the user to select a subset of data in a visualization. Consider the following node-link visualization:
</p>

&nbsp;

<div id="attachment_212"   class="wp-caption alignnone">
  <a href="/uploads/2013/05/Screenshot-from-2013-05-24-131159.png"><img class="size-full wp-image-212" alt="A node-link graph with several nodes and images." src="/uploads/2013/05/Screenshot-from-2013-05-24-131159.png"   height="667" srcset="/uploads/2013/05/Screenshot-from-2013-05-24-131159.png 724w, /uploads/2013/05/Screenshot-from-2013-05-24-131159-300x276.png 300w, /uploads/2013/05/Screenshot-from-2013-05-24-131159-325x300.png 325w" sizes="(max-width: 724px) 100vw, 724px" /></a>
  
  <p class="wp-caption-text">
    A node-link graph with several nodes and images.
  </p>
</div>

<p style="text-align: justify;">
  It contains several nodes and edges making it difficult to make sense of the graph. Suppose the user only wants to focus his exploration on a certain node and all its connected nodes. To do this she would select a subset of nodes. This selection as shown in the following figure is called <strong>brushing</strong>.
</p>

&nbsp;

<div id="attachment_214"   class="wp-caption alignnone">
  <a href="/uploads/2013/05/Screenshot-from-2013-05-24-131237.png"><img class="size-full wp-image-214" alt="A subset of nodes selected in the graph." src="/uploads/2013/05/Screenshot-from-2013-05-24-131237.png"   height="678" srcset="/uploads/2013/05/Screenshot-from-2013-05-24-131237.png 678w, /uploads/2013/05/Screenshot-from-2013-05-24-131237-150x150.png 150w, /uploads/2013/05/Screenshot-from-2013-05-24-131237-300x300.png 300w" sizes="(max-width: 678px) 100vw, 678px" /></a>
  
  <p class="wp-caption-text">
    A subset of nodes selected in the graph.
  </p>
</div>

&nbsp;

<p style="text-align: justify;">
  As I mentioned that most visualization software consist of several different types of visualization. It is often required to visualize a subset of data in different visualizations. This requirement is facilitated by the interaction technique called <strong>Linking</strong>. When a set of data elements is selected in a visualization, the same set gets selected in the other visualizations as well. For instance, consider the <strong>document view</strong> in CZSaw for VAST 2010 mini-challenge1 data-set.
</p>

&nbsp;

<div id="attachment_215"   class="wp-caption alignnone">
  <a href="/uploads/2013/05/Screenshot-from-2013-05-24-135700.png"><img class="size-large wp-image-215" alt="Document view in CZSaw that brushes the entities selected in a list to a document." src="/uploads/2013/05/Screenshot-from-2013-05-24-135700-1024x435.png"   height="256" srcset="/uploads/2013/05/Screenshot-from-2013-05-24-135700-1024x435.png 1024w, /uploads/2013/05/Screenshot-from-2013-05-24-135700-300x127.png 300w, /uploads/2013/05/Screenshot-from-2013-05-24-135700-500x212.png 500w, /uploads/2013/05/Screenshot-from-2013-05-24-135700.png 1295w" sizes="(max-width: 604px) 100vw, 604px" /></a>
  
  <p class="wp-caption-text">
    Document view in CZSaw that brushes the entities selected in a list to a document.
  </p>
</div>

In the document view of CZSaw, when a set of data elements (called entities) is selected in a list of entities, they get selected in the in corresponding document as well as any other visualization such as the hybrid view below:[<img class="alignnone size-full wp-image-216" alt="Screenshot from 2013-05-24 14:03:02" src="/uploads/2013/05/Screenshot-from-2013-05-24-140302.png"   height="615" srcset="/uploads/2013/05/Screenshot-from-2013-05-24-140302.png 754w, /uploads/2013/05/Screenshot-from-2013-05-24-140302-300x244.png 300w, /uploads/2013/05/Screenshot-from-2013-05-24-140302-367x300.png 367w" sizes="(max-width: 754px) 100vw, 754px" />](/uploads/2013/05/Screenshot-from-2013-05-24-140302.png)

Brushing and Linking are two important interaction techniques that are supported in almost every visualization software. **Brushing** **used with Linking form form a very powerful interaction and exploration of data in different visualization software.**