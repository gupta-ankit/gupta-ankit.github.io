---
layout: post
title: Using next and break to return values
date: 2022-07-16 23:27 -0700
---
You are likely already familiar with using the `next` and `break` keywords in Ruby. You might have already used them in your programs for control flow in loops. Here is a quick refresher

# `next` for skipping an iteration

You can `skip` an iteration in a loop by using the `next` keyword. In the example below, the iteration where `n` is even is skipped
```
# print only the odd numbers
(1..10).each do |n|
	next if n%2==0
	puts n
end

# Output:
# 1
# 3
# 5
# 7
# 9
```

# `break` for early termination of the loop

You can use `break` to terminate a loop early like this. The following is a
```
# break loop as soon as the first even number is found
(1..10).each do |n|
	next if n%2==0
	puts n
end

# Ouput
# 1
```

Ruby allows you to specify return values with these keywords, a feature that is not well-known, unfortunately. Here is how that works:

# `next` with return value

Here is a made-up example for the explanation. Suppose, you have a list of subscribers to a newsletter. The list contains emails or addresseses based on the type of subscription:

```
subs = [
"guest",
"email(test@example.com)",
"mail:123 Gem Street",
"#1234",
""
].map do |s|
  next Guest.new if s== "guest"
  next MailSubscriber.new(address: s[5..-1]) if s.start_with?("mail:")
  next EmailSubscriber.new(email: s[6..-2]) if s.start_with?("email(")
  nil
end

# subs:
# [
#  #<struct Guest date=nil>, 
#  #<struct EmailSubscriber email={:email=>"test@example.com"}>,
#  #<struct MailSubscriber address={:address=>"123 Gem Street"}>,
#  nil,
#  nil
# ]
```

# `break` with return value

Similarly, `break` can be used to terminate a loop early and return a value

```
first_email = [
"guest",
"email(test@example.com)",
"mail:123 Gem Street",
"#1234",
""
].each do |n|
	break EmailSubscriber.new(email: s[6..-2]) if s.start_with?("email(")
end

# first_email
# <struct EmailSubscriber email={:email=>"test@example.com"}>
```
