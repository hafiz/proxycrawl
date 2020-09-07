namespace :products do
	task crawling: :environment do
		crawl_urls = ["https://www.amazon.com/s?k=macbook&ref=nb_sb_noss_2", "https://www.amazon.com/s?k=oneplus&ref=nb_sb_noss_2", "https://www.amazon.com/s?k=samsung&ref=nb_sb_noss_2"]

		crawl_urls.each do |url|
			ProxyCrawlApi.new(url: url).crawl
		end
	end
end