class Product < ApplicationRecord
	validates :name, :image_url, :rating, :rating_count, presence: true
	validates :rating_count, numericality: { only_integer: true }
end