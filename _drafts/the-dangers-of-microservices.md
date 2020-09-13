---
layout: post
title: Microservices: Know your tradeoffs
---

Why microservices?
- Ability to deploy independently
- Ability of develop independently and as frequently as possible.

There has been a new 



Microservices are not magic. You will not magically improve the quality of the software. If you are trying to build for a
new domain



Networks are slow
- how much latency between the services.
- 


Service Independence
- Non-blocking development
	- not having much code-conflicts
- Non-blocking deployment


If, in your current monolith codebase, you are using a language that provides you compile-time type checking, know that moving from the monolithic architecture to a 
microservice architecture, you are making a tradeoff; you are choosing independent deployability


Beware of distributed monoliths
The only place where microservices allow you independent deployability and a faster frequency of deployment is when most of the changes made to a service are independent of other services. In other
words, when each of the microservices can be changed independently (most of the time) without needing to coordinate deployments together with other services.


Microservices != Clean Code
I see a growing number of developers drawing a false equivalency between monoliths and "unclean" code. At the same time, they also seem to be under a microservices delusion; they believe that by 
breaking their code into separate services, their codebases will magically become clean. It is important to be aware that to truly get the advantages of a microservice architecture, one must do the due
diligence of taking the existing business flows and breaking them into independent responsibilities (something that Domain Driven Design can help you achieve). If you do not do your due diligence

"Microservices", just like AI and machine-learning has become the new buzz-word that a lot of developers would like to add to their resumes and a lot of companies would like to brag about on their 
jobs section. But, it seems to me (hopefully this is just some unfounded worries) that people are jumping to microservices without realizing all the trade-offs that they are making, and without 
understanding the 
preventive measures that they must make to ensure that they are spending latency and performance over independent deployability. For instance, one way to kill your business is to not take into account
what happens when you implement a microservices architecture based entirely on network calls between several internal microservices. Unless, the monoliths are broken into appropriate and independent 
bounded contexts and these tradeoffs are realized and appropriate mechanisms put 
in place to to ensure that the issues that microservices bring are addressed, there is a high chance that most of the applications that are being broken into microservices today will look like, what is 
referred to as a distributed ball of mud in the next 5-10 years, which will be expotentially harder to clean.


Here are the problems that I think microservices architecture is really good at:
* If your monolith is written in a language/environment that requires that the whole application is restarted and your appplication suffers from slow startup times, 
everytime that a team wants to deploy a new version of a module, you will end up not deploying the changes to your application as frequently as you would like to.
* If the application is designed in a way that the whole application crashes, if a module in the application crashes.

Modular monoliths allow you to develop the code into independent units called modules. The idea here is that you organize a monolith application into modules, where only a single team is responsible 
for making changes to a single module.


