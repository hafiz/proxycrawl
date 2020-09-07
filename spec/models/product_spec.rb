require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:rating_count) }
  it { should validate_numericality_of(:rating_count) }
end