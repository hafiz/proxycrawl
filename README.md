# ProxyCrawl

## Instructions After Cloned

1.  bundle install
2. rake db:create:all
3. rake db:migrate
4. rake products:crawling (initiate product crawl to populate product to database)
5. whenever --update-crontab --set environment='development' (this is to update cron run every week on Monday at 10:00 AM)