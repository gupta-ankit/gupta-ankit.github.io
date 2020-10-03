---
layout: post
title: Does your organization really need microservices?
date: 2020-10-03 10:31 -0700
tags: microservices monoliths microservices-value-proposition
excerpt: It is important that you understand the value proposition of microservices before you can decide if you really want to migrate from your current architecture to a microservices architecture.
It is also important to keep in mind that "Monoliths" and "Microservices" are not your only choices. Microservices and monoliths are two ends of a spectrum. There are several alternatives in between.
---
We, as software developers, and as a software industry keep falling for the false-cause fallacy. We often mistake
technologies that are used at successful companies as the cause of their success. This fallacy comes with a high
cost. We spend hours trying to find the best technology to use, when we should be spending our time and energy into
things such as getting early feedback, improving user experiencce, figuring out what we can deliver better than other, and so on.
That however, is a longer and a separate discussion, to be done in future. Today, I want to talk about one of current
fallacies that is widespread in our industry: Microservices. We have started to fool ourselves into thinking that "Since, the 
big successful companies are using a Microservices architecture, having a microservices architecture is a must for success."


The essence of a microservice architecture lies in decoupling the development and deployment 
of modules of an application from other modules. Any pro or con that you attribute to a microservice architecture
is the result of this decoupling. The pros of any architecture style is the value it provides, and cons is the cost that you have
to pay.

Let's take a look at the values of a microservice architecture (over monolithic architecture).

* **Faster deployments** When components of an application are decoupled, the time it is required to deploy individual components is significantly reduced. This gain
comes from the decrease in build times. Faster deployments can be very important in getting early feedback. This decoupling however, does require more
work in setting appropriate automated tests, along with releasing features incrementally to get the early feedback.

* **Independent scalability** The decoupling will also allow you to independently scale the components of an application. For instance, if you are an
e-commerce website, where you have a lot of visitors, microservice architecture will allow you to scale your cataglog service 
independently from your order or billing services.

These values come with several costs that you must pay. Some of this costs include:

* **Complexity in communication** When you decouple a part of your application into a separate service, the communication with the service becomes more complex than what was just a method call
earlier. Now, you have to ensure that the contracts between the new service and the original application are enforced at the communication level via contract testing. 

* **Higher database costs** Under a microservice architecture, every service has its own database, which is not shared with any other service. This means that each service will often 
have its own database server, which results in much higher costs than a single (or a couple) database servers.

* **Complex debugging** In a monolith code-base when there is an exception, you get to see the complete stack trace, which can help you debug the cause of the error much faster. When multiple
services are deployed, the error that you see in your service can be a result of an error in an upstream service. Now, you will have to enforce a correlation id across
your services to determine the source of error.

There are other costs associated as well, which you should investigate further. Here are two excellant books that I would recommend, if you are interested in learning more
about how to design microservices to address some of the costs of microservices:

The "Building Microservices" book by Sam Newman is an excellant book if are completely new to microservices. It introduces some important concepts that are important in understanding the value of 
microservices.
<a href="https://www.amazon.ca/Building-Microservices-Designing-Fine-Grained-Systems/dp/1492034029/ref=as_li_ss_il?&hvadid=335213572220&hvpos=&hvnetw=g&hvrand=873840772910015900&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9001505&hvtargid=pla-464425939893&psc=1&linkCode=li3&tag=ankitgupta06-20&linkId=84b0ad047e73cb0625cc13b62d8411d3&language=en_CA" target="_blank"><img border="0" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1492034029&Format=_SL250_&ID=AsinImage&MarketPlace=CA&ServiceVersion=20070822&WS=1&tag=ankitgupta06-20&language=en_CA" ></a><img src="https://ir-ca.amazon-adsystem.com/e/ir?t=ankitgupta06-20&language=en_CA&l=li3&o=15&a=1492034029" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />


"Microservices Patterns" is another excellant book that will provide you with specific patterns that you can follow to implement microservices
<a href="https://www.amazon.ca/Microservices-Patterns-examples-Chris-Richardson/dp/1617294543/ref=as_li_ss_il?&hvadid=292950359971&hvpos=&hvnetw=g&hvrand=873840772910015900&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9001505&hvtargid=pla-430608508482&psc=1&linkCode=li3&tag=ankitgupta06-20&linkId=a3424cd0d95d45e7a7d138c236ce435a&language=en_CA" target="_blank"><img border="0" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1617294543&Format=_SL250_&ID=AsinImage&MarketPlace=CA&ServiceVersion=20070822&WS=1&tag=ankitgupta06-20&language=en_CA" ></a><img src="https://ir-ca.amazon-adsystem.com/e/ir?t=ankitgupta06-20&language=en_CA&l=li3&o=15&a=1617294543" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

It is important that you understand the value proposition of microservices before you can decide if you really want to migrate from your current architecture to a microservices architecture. 
It is also important to keep in mind that "Monoliths" and "Microservices" are not your only choices. Microservices and monoliths are two ends of a spectrum. There are several alternatives in between. Here are some of your choices (which I will explain in more detail in future posts):

* **Monolith** If you are just starting out with a new application, keep it simple. A monolith is a perfectly reasonable choice for new projects or companies which are trying to understand what they
want to build.

* **Modular Monolith** If you already have a monolith, a modular monolith is a great option. In fact, this can be a very important step that you take before moving to microservices. The idea of a modular
monolith is that you break your application into modules withing the same code-base, which can be developed independently. A module in such as system is maintained by a single team. Breaking the application
into a modular monolith will give you an opportunity to see if the bounded contexts that you think of withing your application are valid. 

* **Distributed Monoliths** Distributed monoliths are applicable when you want to decouple some big, but independent components. For example, you can have an identity service monolith which serves all 
the different authentication needs for other services within your company (as opposed to breaking every single type of authentication into a separate service).

* **Hybrid designs** Sometimes, all you want is a single feature to be more scalable than the rest, or there might be some other (for instance, compliance) concerns that require that a subset of services, 
then that subset can be broken into separate independent services, while the remaining services run as a monolith application (or some combination of monoliths and services). 

