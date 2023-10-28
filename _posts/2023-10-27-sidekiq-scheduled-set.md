---
layout: post
title: Scheduled jobs in Sidekiq and Rescheduling jobs
date: 2023-10-27 17:27 -0700
---
If you are scheduling jobs in Sidekiq (for example: using `perform_at`), the jobs are not added to Queue. Sidekiq::Queue only stores the jobs that are picked by Sidekiq for execution.

If you want to find scheduled jobs you can use `Sidekiq::ScheduledSet`

**How do I inspect scheduled jobs?**

Scheduled jobs are accessible via `Sidekiq::ScheduledSet` instance. You can call `Sidekiq::ScheduledSet.new.first` to find the first entry.

**How do I reschedule a job?**
Sometimes when testing background jobs (or in Production), you might find yourself needing to reschedule a job so that it runs immediately or gets delayed. You can use the reschedule method.

```
job = Sidekiq::ScheduledSet.new.first
job.reschedule(Time.now) #job will get queued immediately.
```
