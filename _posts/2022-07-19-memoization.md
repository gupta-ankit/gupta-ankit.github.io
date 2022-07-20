---
layout: post
title: 
date: 2022-07-19
---
Memoization is an idiom in Ruby that allows developers to avoid performing expensive computations again
and again. For example, suppose you have a method `price` on an `Item` class that will be called multiple times, but you do
not expect the price to change everytime that you call that method during a session or a request, you can memoize the price.

Here is some code without memoization

```
class Item
  attr_reader :sku

  def initialize(sku)
    @sku = sku
  end

  def price
    # a DB call is made everytime some calls the
    # this method
    Item.find_by_sku(sku).price
  end
end
```

You can memoize the price function as follows:

```
def price
  @price = @price || Item.find_by_sku(sku).price
end
```

Let's see what this does. 

The first time you call `price`, `@price` is `nil`. `nil` in Ruby is a falsey value; so, Ruby now
proceeds to compute the second part of expression `Item.find_by_sku(sku).price`. The price returned by the DB call is then
set as the value `@price` variable. If you are new to Ruby, `@price` is an instance variable, meaning that the value we store in it
is available even after the call to `price` method is complete

Now, you call `price` again. This time, `@price` is not nil. Now, it holds the value that was set the first time `price` was called. So, when
Ruby computes `@price || Item.find_by_sku(sku).price`, it sees a truthy value on the left side of the `||` operator, and returns that value instead
of continuing to compute `Item.find_by_sku(sku).price`.

Now that you understand how memoization works, we can use shorthand expressions to reduce the code. You can use the `||=`. You can rewrite the `price`
method as

```
def price
  @price ||= Item.find_by_sku(sku) # this is same as @price = @price || Item.find_by_sku(sku)
end
```

# Memoizing multiline computations

Now, let's go a little advanced. Suppose, the computation that you want to memoize is actually multiple lines. Here is a method that 
computes the total expenses across different departments that a given user leads

```
def last_month_expenses(user)
  total = 0
  Membership.where(user: user, role: :lead).map |m|
    department = m.department
    unless department.external?
      total += ExpenseService.last_month_total(department_id: department.id)
    end
  end
  total
end
```

One way to memoize is to add a conditional block that checks the value of the memoized variable. This approach is okay, but it hides the intent to memoize.

```
def last_month_expenses(user)
  unless @last_month_expenses
      total = 0
      Membership.where(user: user, role: :lead).map |m|
        department = m.department
        unless department.external?
          total += ExpenseService.last_month_total(department_id: department.id)
        end
      end
      @last_month_expenses = total
  end
  @last_month_expenses
end
```

A better way to memoize computation that spans across multiple lines is to use blocks. Here is how you do it

```
def last_month_expenses(user)
  @last_month_expenses ||= begin
    total = 0
    Membership.where(user: user, role: :lead).map |m|
      department = m.department
      unless department.external?
        total += ExpenseService.last_month_total(department_id: department.id)
      end
    end
    total
  end
end
```

This version is more idiomatic and the memoization is clear. This approach works because blocks in Ruby, similar to methods, return the result on the last line (which is then assigned to `@last_month_expenses`).
