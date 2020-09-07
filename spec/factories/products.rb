FactoryBot.define do
	factory :product do
	  name { "iPhone" }
	  image_url { "https://m.media-amazon.com/images/I/61TVfRPlcdL._AC_UY218_.jpg" }
	  rating { "4.6 out of 5 stars" }
	  rating_count { "100" }
	end
end
