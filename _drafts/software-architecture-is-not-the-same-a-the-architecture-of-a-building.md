---
layout: post
title: Software architecture is not the same a the architecture of a building
---

What do we mean by software architecture?


Is it fair to compare software architecture with the architecture of buildings?

There are several talks and blog posts that have tried to convince the developers that the architecture for a software system and that of a building are the same thing. And, that in my opinion is a very
simplistic, if not dangerous, way to look at software design. I understand and agree that developers should be able to tell what their architecture looks like 
(checkout the C4 model, if you are not familiar with it)

Here is an example that Robert C. Martin presents. He presents the blueprint of a library and tells us that he can look at the blueprint and immediately tell that it is a library. Now, I do not understand
how being able to immediately tell what that is of any help.

Rather than comparing the blueprint of a building with the architecture of a software, a better comparison, if you insist on keeping the same analogy, is to compare the plans for plumbing or electrical wires 
in a building, rather than the blueprint. 


If the parallels drawn are to be taken at face-value, here is what you are being told
* The frequency with which a software architecture changes is the same as the frequency with which a building's architecture changes. That is not true. The reason I bring the frequency of design changes
is because the software design and the components needed to make all of it work will change quite rapidly, at least in the initial phases of the project.


Comparing software architecture to a building's blueprint creates a discourse that promotes impostor-syndrome. It does not take into account the work that goes into updating the architecture as the 
design requirements change. We have now known for quite some time that early feedback [for most systems] is more important than spending lots of time designing the "perfect" system, simply because 
it is not possible to know all the requirements at the beginning. Software is also unique in this regard because software allows for changing of requirements throughout its development, which concrete 
building do not allow for that easily. Imagine a world where software could not be changed, once it is written and handed over to the customer. It would definitely make sense to compare building 
architectures with software architectures in that world. The only reason we are able to change the architecture is because we are now largely living in a world where the software is deployed in the 
cloud and changes very rapidly.

It is not the case that we do not have parallels in the computer world. If you look at software that runs on the laptop such as IDEs, or media applications, their core architecture largely 
remains unchanged. Another example would be processor designs. Since change to requirements of a chip on the fly are not possible, chip manufactures have a clear architecture which tells what the chip
does. To expect the same from the architecture of a software that is changing rapidly on-the-fly on a daily basis is simply unreasonable.
