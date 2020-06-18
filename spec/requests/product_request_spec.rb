require 'rails_helper'

RSpec.describe 'POST /categories/category_id/products', type: :request do
  let(:category) { create(:category) }
  let(:url) { "/categories/#{category.id}/products" }
  describe 'POST /categories/category_id/products' do
    context 'create' do
      let(:params) do
        { product: {
           category_id: category.id,
           price: 23.50,
           quantity: 10
         },
         subtypes: {
          size: 'L',
          design: 'plain'
        }
       }
     end
      it 'returns increments the number of products' do
        expect{ post url, params: params, as: :json }.to change { Product.count }.by(1)
      end
    end
  end
end

RSpec.describe 'GET /categories/category_id/products', type: :request do
  let(:category) { create(:category) }
  let(:url) { "/categories/#{category.id}/products" }
  before do
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'GET /category/id', type: :request do
  before do
    category = FactoryBot.create(:category)
    product = FactoryBot.create(:product, category_id: category.id)
    url = "/categories/#{category.id}/products/#{product.id}"
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'PATCH /category/id', type: :request do
  before do
    category = FactoryBot.create(:category)
    product = FactoryBot.create(:product, category_id: category.id)
    params = { product: {
                category_id: category.id,
                price: 50.0,
                quantity: 10
              },
              subtypes: {
                size: 'L',
                design: 'plain'
              }
            }
    patch "/categories/#{category.id}/products/#{product.id}", params: params, as: :json
  end

  it 'updates record' do
    expect(Product.first.price).to eq(50.0)
  end
end

RSpec.describe 'DELETE /category/id', type: :request do
  before do
    category = FactoryBot.create(:category)
    product1 = FactoryBot.create(:product, category_id: category.id)
    product2 = FactoryBot.create(:product, category_id: category.id)
    delete "/categories/#{category.id}/products/#{product1.id}"
  end
  
  it 'deletes category' do
    expect(Product.count).to eq(1)
  end
end