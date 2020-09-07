require 'rails_helper'

RSpec.describe 'Products API' do
  # Initialize the test data
  let!(:product) { create(:product) }
  let(:id) { product.id }

  # Test suite for GET /api/v1/products/:id
  describe 'GET /api/v1/products' do
    before { get "/api/v1/products" }

    context 'when product exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all product products' do
        expect(json.size).to eq(1)
      end
    end
  end

  # Test suite for GET /api/v1/products/:id
  describe 'GET /api/v1/products/:id' do
    before { get "/api/v1/products/#{id}" }

    context 'when product exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the product' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when product product does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Product with 'id'=0\"}")
      end
    end
  end

  # Test suite for PUT /api/v1/products/:id
  describe 'PUT /api/v1/products/:id' do
    let(:valid_attributes) { { name: 'Iphone', image_url: "https://m.media-amazon.com/images/I/61TVfRPlcdL._AC_UY218_.jpg", rating: "4.6 out of 5 stars", rating_count: "500" } }

    context 'when request attributes are valid' do
      before { put "/api/v1/products/#{id}", params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when an invalid request' do
      before { put "/api/v1/products/#{id}", params: {name: nil} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for DELETE /api/v1/products/:id
  describe 'DELETE /api/v1/products/:id' do
    before { delete "/api/v1/products/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end