class ProxyCrawlApi
  include HTTParty
  base_uri "https://api.proxycrawl.com/?token=1Rz0EGy3bg_Rl3N6R2z9qw&"

  attr_accessor :url

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def crawl
  	response = ProxyCrawlApi.get("url=#{ERB::Util.url_encode(url)}")
  	html_parsing(response) if response.code == 200
  end

  def html_parsing(response)
  	keys = [:name, :image_url, :rating, :rating_count]
  	doc = Nokogiri::HTML(response.body)

  	product_name = []
  	doc.css('.s-line-clamp-2').css('.a-link-normal.a-text-normal').css('.a-size-medium').collect do |pose_type|
  	    product_name << pose_type.text
  	end

  	product_image = []
  	doc.css('.a-section.aok-relative.s-image-fixed-height').css('.s-image').collect do |post_type|
  		product_image << post_type.attr('src')
  	end

  	product_rating = []
  	doc.css('.sg-col-20-of-28').css('.a-row.a-size-small').css('.a-icon-alt').collect do |post_type|
  		product_rating << post_type.text
  	end

  	product_rating_count = []
  	doc.css('.sg-col-20-of-28').css('.a-row.a-size-small').css('.a-size-base').collect do |post_type|
  		product_rating_count << post_type.text
  	end

  	data = product_name.zip(product_image, product_rating, product_rating_count)

  	data_hash = data.map{|s| Hash[keys.zip(s)]}
  	process_parsing_data(data_hash)
  end

  def process_parsing_data(data_hash)
  	data_hash.each do |data|
  		Product.find_or_create_by(name: data[:name]) do |product|
  		  product.image_url = data[:image_url]
  		  product.rating = data[:rating]
  		  product.rating_count = data[:rating_count].try(:gsub, ',','').to_i
  		end
  	end
  end
end