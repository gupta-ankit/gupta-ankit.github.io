---
layout: post
title: You got one chance!
tags: ruby fun
date: 2022-07-27 22:14 -0700
---
Just because you can does not mean you should. But, it is still fun!

Today, I want to take a detour and get a little silly. Recently, I discovered the `undef` 
keyword that can be used un-define stuff.


![](https://media.giphy.com/media/AlEp8Fj45KPLO/giphy.gif)

Suppose you are building an object that accepts a message to reveal a secret. But, you want to ensure that
once the secret is revealed, the object has "no-memory" of ever being able to reveal
secrets


```
class ForgetfulCourier

  def reveal_secret
    undef :reveal_secret
    "this is a secret message"
  end

end
```

Let's call `reveal_secret` twice.

```
3.0.2 :012 > courier = ForgetfulCourier.new
 => #<ForgetfulCourier:0x000055759d0c7e30>
3.0.2 :013 > courier.reveal_secret
 => "this is a secret message"
3.0.2 :014 > courier.reveal_secret
(irb):14:in `<main>': undefined method `reveal_secret' for #<ForgetfulCourier:0x000055759d0c7e30> (NoMethodError)
```

Once the secret is revealed, it can no-longer be used. Okay, that was fun. But, please don't use this in Production. Why? because the behaviour will be
confusing and frustrating to the caller. 

Ruby has some similar methods, some of which (including `undef`) are used in Rails. But, I cannot
think of any _real_ scenario in my projects, where this technique would be useful. But, if you have used this, I would love to hear about your use-case.

__Update__

One of the limitations (or so I thought) of the class above is that if the secret message was stored as an attribute, inspecting the `courier` object
would allow the caller to access the secret. Let me show you. Let's modify `ForgetfulCourier` so that the secret message is stored at initialization:

```
class ForgetfulCourier

  def initialize(secret)
    @secret = secret
  end

  def reveal_secret
    undef :reveal_secret
    @secret
  end
end
```

As before, the caller can still call `reveal_secret` only once. But, the caller can still see the message by just calling `courier.inspect`

```
3.0.2 :049 > courier.inspect
 => "#<ForgetfulCourier:0x000055c66c7ca640 @secret=\"secret message\">"
```

But, then some fellow Rubyists introduced me to `remove_instance_variable`, which I can use to completely remove the secret from its existance. Here is the modified class

```
class ForgetfulCourier
  def initialize(secret)
    @secret = secret
  end

  def reveal
    undef :reveal
    remove_instance_variable :@secret
  end
end
```

Now, if I inspect after revealing the message, the secret is gone

```
3.0.2 :063 > c.inspect
 => "#<ForgetfulCourier:0x000055c66c910db0>"
```

There is still some stuff that needs to be done to ensure that the caller has no way of fetching the secret more than once. For instance, the caller may never call
`reveal`; instead only call inspect to fetch the value. It is possible to use the same techniques discussed above to make our `ForgetfulCourier` more secure. I will leave
that as an exercise for the reader.