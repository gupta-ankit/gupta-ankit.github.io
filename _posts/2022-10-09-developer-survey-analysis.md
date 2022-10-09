---
layout: post
title: developer-survey-analysis
tags: developer-survey stackoverflow ruby data-analysis
date: 2022-10-09 04:13 -0700
---
Some time ago StackOverflow released the results of the 2021 Developer Survey. One of the things that I was interested in was how the Ruby community is doing (at least the one on StackOverflow).

And, the results were interesting. Compared to previous year, Ruby is still the 17th most commonly used programming languages, with a slight decrease in the percentage of respondets who use Ruby (6.05% vs 6.75%). Also, similar to last year around 50% of those who use Ruby
love it, and the other half hate it (a programming language is deemed as dreaded/hated by a respondent if the list of languages that they want to use does not include the language they are currently using). That means that if a respondent mentioned Ruby as one of the languages
that they used last year, but the list of languages that they want to use does not include Ruby, that is inferred as the respondent not liking Ruby.

Among those who are full-time software developers:
1. What languages interest those who no longer love Ruby?
2. What languages are potential Rubyists using?


# What languages interest those who no longer love Ruby?
The top 5 languages that current professional Ruby developers want to use are Rust, Go, Typescript, Elixir, and Kotlin.

```
Rust            395     11.02
Go              307     8.56
TypeScript      152     4.24
Elixir          130     3.63
Kotlin          128     3.57
```

# What languages are potential Rubyists using?
Around 11K (2%) professional developers would like to use Ruby. The top 5 languages that these users are using Javascript, HTML, SQL, Python, Typescript, and Java

It seems that a lot of Ruby developers are moving to Rust and Go. What about me? Well, I am still gonna use Ruby for scripts and Rails for rapidly getting a working piece of software in front of the customers. That said, I
am also actively using Go for services that are built for high-performance platform services.

[Here](https://github.com/gupta-ankit/developer-flow) is the code that I used for analysis.