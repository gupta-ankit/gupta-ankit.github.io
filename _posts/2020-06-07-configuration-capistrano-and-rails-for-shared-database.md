---
layout: post
title: How to set Capistrano to share SQLite database across releases?
tags: capistrano ruby-on-rails sqlite
date: 2020-06-07 22:57 -0700
---
Rails applications that expect heavy traffic require a scalable database such as Postgres or MySql. However, SQLite
might be sufficient for low-traffic applications or apps in the initial development phase, where you do not want to
spend the resources and time required to set up and configure a database such as Postgres or MySQL.

If you are using Capistrano to manage your deployment, the default configuration for the database (database.yml) and
Capistrano will result in a new database created for every release. This results in the loss of resources (such as
users) that you created in the previous release.

Here are the two quick and simple changes that you can make to have a shared SQLite database across your releases.

First, I like to change the database configuration to have a separate database folder for storing the database. I use
<code>db/database/production.sqlite3</code> instead of <code>db/production.sqlite3</code>.

Here is what the database.yml file looks like

{% highlight ruby %}
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/database/production.sqlite3

{% endhighlight %}

The second change is to append the database directory to the list of shared directories.

{% highlight ruby %}
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
      'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'db/database'
{% endhighlight %}

This setting tells Capistrano to have the database directory shared across releases. For every release, Capistrano will create a symlink for the database directory that will point to the shared database directory