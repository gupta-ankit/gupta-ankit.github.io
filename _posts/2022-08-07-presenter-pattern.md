---
layout: post
title: Separating presentation concerns
tags: ruby patterns
date: 2022-08-07 03:04 -0700
---
When building applications that present information to the user --- either via CLI or GUI ---
we have to write code that formats information so that it is easy to read. Presenter pattern is
a simple pattern that separates the "presentation" and business concerns.

Several years ago, I was introduced to this pattern by a 
[blog post from Jay Fields](http://blog.jayfields.com/2007/03/rails-presenter-pattern.html).
However, the post was centered around Rails, and myself being new to Ruby and Rails at the time, found it a little hard to understand.

So, I finally decided to write a short post that presents the "Presenter Pattern", with 
simple Ruby code (and without any fancy gems or Ruby magic). My goal is to introduce this pattern
to those who are new to Ruby (or programming in general).

Consider a simple class called Financials that tracks revenues per year

```ruby
class Financials
  attr_reader :revenues, :country

  # revenues is a Hash that maps year to the corresponding revenue
  # {
  #   2018 => 100000,
  #   2019 => 10000,
  #   ...
  # }
  def initialize(country:,revenues:)
    @country = country
    @revenues = revenues
  end

  # This method computes the growth of revenue, compared to previous year
  # {
  #   2018 => nil,
  #   2019 => -0.9,
  #   ...
  # }
  def revenue_growths
    growths = {}
    revenues.each_with_index do |(year, revenue), i|
      if i==0
        growths[year] = nil
      else
        growths[year] = (revenue - revenues[year-1])/revenues[year-1].to_f
      end
    end
    growths
  end
end
```

Now, I want to write a simple method that prints the revenues and growths on the console.

```ruby
def show_report(revenues)
  f = Financials.new(country: "US", revenues: revenues)
  puts "year\trevenue\trevenue_growths"
  f.revenues.each do |year, revenue|
    puts "#{year}\t#{revenue}\t#{f.revenue_growths[year]}"
  end
end
```

This prints the following table.

```
year    revenue revenue_growths
2018    100000
2019    10000   -0.9
2020    1000    -0.9
2021    5000    4.0
```

Let's try to make it more readable by adding the currency and a unit prefix for the revenues, and converting the growths to
percentage.

```ruby
def show_report2(revenues)
  f = Financials.new(country: "UK", revenues: revenues) 
  puts "year\trevenue\trevenue_growths"
  currency_symbol = case f.country
                    when "US" "$"
                    when "GB", "UK" "€"
                    end
  f.revenues.each do |year, revenue|
    revenue_k = "#{revenue/1000}K"
    growth = if f.revenue_growths[year].nil?
               "N/A"
             else
               "#{f.revenue_growths[year] * 100}%"
             end
    puts "#{year}\t#{currency_symbol}#{revenue_k}\t#{growth}"
  end
end
```

This prints

```
year    revenue revenue_growths
2018    100K    N/A
2019    10K     -90.0%
2020    1K      -90.0%
2021    5K      400.0%
```

While the new `show_report2` presents the information is a more readable format, I find the code harder to read
due to the conditionals and intermediate variables. I find `show_report` much more readable than `show_report2`.
This difficulty in reading the code intensifies as we add more fields to the `Financials` class.

What I need is a way to have the readability of `show_report` as well as the formatted report that `show_report2` generates.
Here is where we can make use of the Presenter pattern. Let's introduce a new class that encapsulates all our formatting concerns.
The `FinancialsPresenter` object will wrap a `Financials` object. Here is what that class looks like

```ruby
class FinancialsPresenter
  def initialize(financials)
    @financials = financials
  end

  def revenues
    @financials.revenues.map { |year, revenue|
      [year, "#{currency}#{@financials.revenues[year]/1000}K"]
    }.to_h
  end

  def revenue_growths
    @financials.revenue_growths.map { |year, growth|
        [year, (growth.nil? ? "N/A" : "#{growth * 100}%")]
      }.to_h
  end

  private
  def currency
    case @financials.country
    when "UK", "GB"
      "€"
    when "US"
      "$"
    end
  end
end
```

Now, we can get back to our previous version of `show_report` (with one small change)

```ruby
def show_report3(revenues)
  # FinancialPresneter is wrapping a Financials object
  f = FinancialsPresenter.new(Financials.new(country: "UK", revenues: revenues))

  puts "year\trevenue\trevenue_growths"
  f.revenues.each do |year, revenue|
    puts "#{year}\t#{revenue}\t#{f.revenue_growths[year]}"
  end
end
```

So, that's your Presnter pattern. Since we were dealing with just strings for the output, our presenter was just returning strings.
In Rails, where you want to generate an HTML output, the presneter might (return HTML content tags)[https://www.rubyguides.com/2019/09/rails-patterns-presenter-service/], but
the basic idea remains same --- separating the presentation concerns from the business logic.

This approach of separating the presentation concerns comes with another advantage; it is now much more easier to write tests that validate the output. We can write tests that validate
that the Presenter returns the strings in the right format; no need to capture standard output or the rendered HTML (in case of Rails).

(Here is all the code)[https://gist.github.com/gupta-ankit/8868300906979d34a9fee164140435f4]