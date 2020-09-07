# ProxyCrawl

## Instructions After Cloned

1.  bundle install
2. rake db:create:all
3. rake db:migrate
4. rake products:crawling (initiate product crawl to populate product to database)
5. whenever --update-crontab --set environment='development' (this is to update cron run every week on Monday at 10:00 AM)
6. List of APIs
	1. GET /products	List all products
	2. POST /products	Create a new product
	   1. parameters { name: "Iphone", image_url: "https://m.media-amazon.com/images/I/61TVfRPlcdL._AC_UY218_.jpg", rating: "4.6 out of 5 stars", rating_count: "500" }
	3. GET /products/:id	Get a product
	4. PUT /products/:id	Update a product
	   1. parameters { name: "Iphone", image_url: "https://m.media-amazon.com/images/I/61TVfRPlcdL._AC_UY218_.jpg", rating: "4.6 out of 5 stars", rating_count: "500" }
	5. DELETE /products/:id 	Delete a product