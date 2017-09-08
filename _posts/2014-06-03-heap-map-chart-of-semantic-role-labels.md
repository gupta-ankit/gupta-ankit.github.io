---
id: 416
title: Heat Map Chart of Semantic Role Labels
date: 2014-06-03T14:03:39+00:00
author: ankit
layout: post
guid: http://www.blog.ankit-gupta.com/?p=416
permalink: /heap-map-chart-of-semantic-role-labels/
categories:
  - Uncategorized
tags:
  - heat-map
  - semantic role labelling
  - visual analytics
---
<p style="text-align: justify;">
  While doing text analytics on a large document collection, the analyst is often looking for relationships between entities like person, organization, location etc. The existing approaches to finding related entities automatically are quite primitive. They are generally some variant of finding relationship by co-citation of entities and bibliographic coupling of documents. According to this scheme, two entities are considered &#8220;related&#8221; if they are mentioned in the same document. Conversely, two documents are considered related, if they have common entities mentioned in them. A major problem with this scheme of &#8220;relatedness&#8221; is that the nature of relationship (semantics) between two entities is unknown until the documents mentioning the entities together are not read by the analyst.
</p>

<p style="text-align: justify;">
  Another problem with this approach is that it can generate a large number of false positives. It is possible that two entities are mentioned in the same document but they are not related in any meaningful way. The current approach will still show these entities as related along with other related entities that are actually useful for the analysis task. Since there is no information about the nature of relationship, the task of separating the useful relationships from the rest can be challenging in large document collections.
</p>

<p style="text-align: justify;">
  To tackle this problem, I have recently started looking in a natural language processing technique called Semantic Role Labeling (SRL) and how it can be used to support analytics for large document collections. Automated SRL, first developed by Daniel Gildea and Daniel Jurafsky [1] is an interesting machine learning technique which tries to identify the semantic arguments associated with the verb/predicate in a sentence. These semantic roles capture a higher level structure of text than what a syntax tree does. Consider a simple sentence like this:
</p>

<p style="text-align: center;">
  <strong>Joe sold the car.</strong>
</p>

<p style="text-align: justify;">
  For the sentence above, the task of semantic role labeling is to identify the predicate &#8220;to sell&#8221; and its associated semantic arguments &#8220;Joe&#8221; as the <strong>seller</strong><strong> </strong>and &#8220;car&#8221; as the <strong>thing_sold</strong>. The arguments also referred to as &#8220;A0/Proto-Agent&#8221; and &#8220;A1/Proto-Patient&#8221; in the NLP world and the predicate form what I refer to as an SRL triple (or just a triple). For the sentence above, for example SRL generates the triple (Mary, sell, John). The roles &#8220;seller&#8221; and &#8220;thing_sold&#8221; are called &#8220;roleA0&#8221; and &#8220;roleA1&#8221; since they are the semantic roles for A0 and A1 arguments of the triple.
</p>

<p style="text-align: justify;">
  The first idea that came to mind was to simply use the verbs to show the relationships. But that did not work. The problem is that most documents do not contain simple sentences like &#8220;Joe sold the car.&#8221; Instead, they contain much more complex sentences which result in arguments that may be several words long, often containing several entities. In such a situation, it is difficult to identify the entities within documents that are related by the given predicate. So, I started looking at another ways that the information might be useful.
</p>

<p style="text-align: justify;">
  I tried to generate a heat map chart of the semantic roles in the document collection. The idea was to get some idea about the distribution of semantic roles over the collection. Admittedly, this was not aimed at solving the original problem of meaningless relationships. Rather it was an attempt to discover if there are any interesting pattern of semantic roles in the document collection.
</p>

<p style="text-align: justify;">
  Given a collection of triples for a document collection, first, I calculated the number of triples for every possible pair of roleA0 and roleA1. Since this exercise was a shot in the dark, I resisted from writing code for generating the visualization. Rather I used excel for generating the heat map. Once, I had the number of triples for every pair, I put the roleA0s as the first column and roleA1s in  the first column. The cell at the intersection of roleA0 row and roleA1 column contained the number of triples that they have in the collection. Once I had this, I used the conditional-formatting feature in excel to generate the heat map. Here is the excel file with the heat map, that I got as a final output.
</p>

<p style="text-align: justify;">
  <a href="/uploads/2014/06/Vast2010_HeatMapChartExcel_26May2014.xlsx">HeatMapChartExcel_26May2014</a>
</p>

<p style="text-align: justify;">
  If you look at the file, there are just too many rows and columns for a data that is so sparse. Clearly, the heat map was not a great idea. A node-link diagram or some other visualization technique for sparse data might have been better solution. I completely failed at estimating what the heat map chart for my data will look like. In any case, this was not an exercise completely in vain. It definitely improved my understanding of the data that I am dealing with.
</p>

<p style="text-align: justify;">
  References:
</p>

  1. <span style="color: #222222;">Gildea, Daniel, and Daniel Jurafsky. &#8220;Automatic labeling of semantic roles.&#8221;</span><i style="color: #222222;">Computational linguistics</i><span style="color: #222222;"> 28.3 (2002): 245-288.</span>
  2. Semantic Role Labeling, http://en.wikipedia.org/wiki/Semantic\_role\_labeling