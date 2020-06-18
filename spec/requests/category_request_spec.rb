require 'rails_helper'

RSpec.describe 'POST /categories', type: :request do
  let(:url) { '/categories' }
  describe 'POST /categories' do
    context 'create' do
      before do
        post url, params: params, as: :json
      end

      let(:params) do
        { category: {
           name: Faker::Name.unique.name
         }
       }
     end
      it 'returns status 201 created' do
        expect(response).to have_http_status(201)
      end
    end

    context 'change count' do
      let(:params) do
        { 
          category: {
           name: Faker::Name.unique.name
         }
       }
     end

      it 'changes count of categories' do
        expect{ post url, params: params }.to change { Category.count }.by(1)
      end
    end

    context 'wrong params' do
      let(:params) do
        { 
          category: {
            name: ''
          }
       }
      end

      before do
        post url, params: params, as: :json
      end

      it 'returns errors' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

end

RSpec.describe 'GET /categories', type: :request do
  let(:url) { '/categories' }
  before do
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'GET /category/id', type: :request do
  let(:category) { create(:category) }
  let(:url) { "/categories/#{category.id}" }
  before do
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'PATCH /category/id', type: :request do
  before do
    category = FactoryBot.create(:category)
    patch "/categories/#{category.id}", params: { category: {name: 'Updated_name'}}, as: :json
  end

  it 'updates record' do
    expect(Category.first.name).to eq('Updated_name')
  end
end

RSpec.describe 'DELETE /category/id', type: :request do
  before do
    category1 = FactoryBot.create(:category)
    category2 = FactoryBot.create(:category)
    delete "/categories/#{category1.id}"
  end
  
  it 'deletes category' do
    expect(Category.count).to eq(1)
  end
end