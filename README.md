# ProxyCrawl

## Instructions After Cloned

1.  bundle install
2. rake db:create:all
3. rake db:migrate
4. rake products:crawling (initiate product crawl to populate product to database)
5. whenever --update-crontab --set environment='development' (this is to update cron run every week on Monday at 10:00 AM)
6. List of APIs (Basic Auth. Username: ProxyCrawl and Password: proxxxy)
	1. GET /api/v1/products - List all products
	2. POST /api/v1/products - Create a new product
	   1. parameters
	   	  1. name
	   	  2. image_url
	   	  3. rating
	   	  4. rating_count
	3. GET /api/v1/products/:id - Get a product
	4. PUT /api/v1/products/:id - Update a product
	   1. parameters
	   	  1. name
	   	  2. image_url
	   	  3. rating
	   	  4. rating_count
	5. DELETE /api/v1/products/:id - Delete a product