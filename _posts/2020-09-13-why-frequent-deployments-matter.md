---
layout: post
title: Why you should deploy to production more often?
tags: continuous-delivery deployment-frequency
date: 2020-09-13 02:39 -0700
excerpt: Frequent deployments allow the developers to get early feedback and correct their course. There is some research that suggestshows a positive correlation between high-performing teams and deployment frequency. In this post, I talk about why frequent deployments are important and how you can increase your deployment frequency.
---
## Why you should deploy more frequently?
Over time, the software industry has discovered a significant factor in successfully developing software projects: “early feedback.” Unlike hardware, Software allows us 
to deliver features incrementally to our users and get feedback on those features as soon as they are delivered. The early feedback enables 
developers to improve their understanding of the requirements and detect bugs early.

Therefore, your team must deliver changes to production as frequently as possible. When I say “deploy to production,” I mean getting actual users to use the new features as often 
as possible. Instead of waiting on getting all the requirements before writing the first line of code, your team should identify a small subset of useful features 
(often referred to as the “minimum viable product”) that will add value to actual users. You should also keep in mind that the MVP is too big if it takes more than one month to 
deliver (not including the time it takes to set up your infrastructure and build pipeline, which should not take more than two weeks).

There would be times when the code that you deploy does not add a new feature —-- perhaps a bug-fix or performance-improvement --- and you should treat these code changes as 
any other code change. Your goal should be to deliver any code change that your team makes as soon as possible. 

There is some evidence that shows a positive correlation between high-performing teams and deployment frequency. You can read more about 
the research in the [Accelerate book by Forsgren and colleagues](https://amzn.to/3c58tNf). I highly recommend this book if you are interested in knowing what makes a highly performant team. 
The authors discuss the factors that they found to be driving software delivery performance and how that can give your business a competitive advantage.


## So, how do you measure deployment frequency? 

Well, it is quite simple. You take the number of times that you deploy code to production over a period of time, and divide it by the 
number of working days in that time period. So, if you deployed code to production 5 times in the last 2 weeks (10 working days), your deployment frequency is 5/10 = 0.5, i.e. on average you deploy 
every other day or 2-3 times a week.

That said, you should not be increasing your deployment frequency by compromising quality. You should still write tests and have them run as part of your build process; you should 
still try to deliver bug-free code; your increased deployment frequency should not result in increased application crashes. There are other metrics, in addition to deployment frequency, that you 
should track, which can read about in the "Accelerate" book.

## How do you increase deployment frequency?
Collecting metrics around deployment frequency is just the first step. The metrics, if collected regularly, should give you an insight into what makes your deployments slow. There are a variety of
factors that prevent teams from deploying more frequently. Here are some of the factors that I have observed to be contributing to low deployment frequencies

### High Coupling
If almost every change that your team makes requires you to wait for a change in a service maintained by another team, you will have trouble deploying more frequently. This dependency between deployments is a sign of badly decomposed services. If you are experiencing this, the one thing you must do is think again on how to decompose the application better so that the business logic is not distributed across several services. I would highly recommend the [DDD book by Eric Evans](https://amzn.to/2Rlv6Dh). You do not have to do DDD for your services necessarily, but I found the book to be very
useful when trying to reduce the coupling between different services.

### Lack of automation
Another factor that can dampen your deployment frequency is a lack of automation. If your build pipeline is essentially manual compilation, test, and deployment, there is a high chance that you will end up not deploying the code as often as you want. If your team can afford, you should invest in tools such as TeamCity, Jenkins or something similar that allows you to achieve one-click deployments. If you cannot afford one, do put in some time to write a suite of scripts that give you the functional equivalent of one-click deployments (it is not as hard as it might sound). The more automation you can add to your deployment process (including testing), the less burden your production deployments become.

### Red tape
I hope you never have to work in an environment where every production release must be reviewed and approved by many other teams and many notifications before being deployed to production. If you are working for such a company, here is some free advice: RUN!

### Fragile tests
If you have any tests that, when run on the same version of code, fail only some of the time, those tests are useless. The only thing those tests do is breaks your build with no useful feedback about your change. Please get rid of them! Fragile tests prevent you from deploying more frequently, without any useful feedback. If a test fails, it should immediately tell you what part of your business logic is broken by a change you made.

### Lack of confidence
Your team might lack the confidence to deploy more frequently. There can be several factors that can affect your team's confidence. Some factors that I have often found at play include:
* Lack of any tests
* Too much reliance on only unit tests. Unit tests test units, which often are functions. If you are testing your units by stubbing/mocking their dependencies, your unit tests will never
test if the units work as expected when calling actual dependencies. Investing some effort in integration/system/acceptance tests will help you detect such errors early on and help your team build
the confidence it needs to deploy more frequently. Relying only on unit tests is not a good idea, but having units tests is way better than no tests at all.
* If your services lack production metrics and logs, it can be excruciating to detect your code's troublesome areas. Lack of insight into the application will make it harder to fix your code and reduce your confidence when deploying any changes.
