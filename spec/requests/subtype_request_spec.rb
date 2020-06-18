require 'rails_helper'

RSpec.describe 'POST /subtypes', type: :request do
  let(:url) { '/subtypes' }
  describe 'POST /subtypes' do
    context 'create' do
      before do
        post url, params: params, as: :json
      end

      let(:params) do
        { subtype: {
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
          subtype: {
           name: Faker::Name.unique.name
         }
       }
     end

      it 'changes count of categories' do
        expect{ post url, params: params }.to change { Subtype.count }.by(1)
      end
    end

    context 'wrong params' do
      let(:params) do
        { 
          subtype: {
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

RSpec.describe 'GET /subtypes', type: :request do
  let(:url) { '/subtypes' }
  before do
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'GET /category/id', type: :request do
  let(:subtype) { create(:subtype) }
  let(:url) { "/subtypes/#{subtype.id}" }
  before do
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'PATCH /subtype/id', type: :request do
  before do
    subtype = FactoryBot.create(:subtype)
    patch "/subtypes/#{subtype.id}", params: { subtype: {name: 'Updated_name'}}, as: :json
  end

  it 'updates record' do
    expect(Subtype.first.name).to eq('Updated_name')
  end
end

RSpec.describe 'DELETE /subtype/id', type: :request do
  before do
    subtype1 = FactoryBot.create(:subtype)
    subtype2 = FactoryBot.create(:subtype)
    delete "/subtypes/#{subtype1.id}"
  end
  
  it 'deletes category' do
    expect(Subtype.count).to eq(1)
  end
end