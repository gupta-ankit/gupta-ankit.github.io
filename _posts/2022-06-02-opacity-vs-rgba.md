---
layout: post
title: 'CSS: opacity vs rgba'
date: 2022-06-02 10:24 -0700
---
There are two ways of making an HTML element transparent: opacity and background color.

```
/* Using opacity */
.opacity-example {
  background-color: rgb(0,255,255);
  opacity: 0.5;
}

/* Using background color */
.background-example {
  background-color: rgba(0,255,255,0.5);
}
```

```
<div class="opacity-example">
This is made transparent using opacity property
</div>

<div class="background-example">
This is made transparent using alpha channel
</div>
```

The `opacity` property will be applied to all children of the element, including any text. However, `background-color` will only be applied to the background. Compare the two outputs below:

![Opacity makes all child elements transparent](/assets/images/opacity-vs-css.png)

**TIP**: This distinction is quite important in case of modals where you cannot hide text by using opacity, as the opacity property will be applied to any child elements as well.