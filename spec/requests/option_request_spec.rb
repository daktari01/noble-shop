require 'rails_helper'

RSpec.describe 'POST /subtypes/subtype_id/options', type: :request do
  let(:subtype) { create(:subtype) }
  let(:url) { "/subtypes/#{subtype.id}/options" }
  describe 'POST /subtypes/subtype_id/options' do
    context 'create' do
      let(:params) do
        { option: {
           name: Faker::Name.unique.name
         }
       }
     end
      it 'returns increments the number of options' do
        expect{ post url, params: params, as: :json }.to change { Option.count }.by(1)
      end
    end
  end
end

RSpec.describe 'GET /subtypes/subtype_id/options', type: :request do
  let(:subtype) { create(:subtype) }
  let(:url) { "/subtypes/#{subtype.id}/options" }
  before do
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'GET /subtype/id', type: :request do
  before do
    subtype = FactoryBot.create(:subtype)
    option = FactoryBot.create(:option, subtype_id: subtype.id)
    url = "/subtypes/#{subtype.id}/options/#{option.id}"
    get url
  end
  
  it 'returns status 200 OK' do
    expect(response).to have_http_status(200)
  end
end

RSpec.describe 'PATCH /subtype/id', type: :request do
  before do
    subtype = FactoryBot.create(:subtype)
    option = FactoryBot.create(:option, subtype_id: subtype.id)
    params = { option: {
                name: 'New name'
              }
            }
    patch "/subtypes/#{subtype.id}/options/#{option.id}", params: params, as: :json
  end

  it 'updates record' do
    expect(Option.first.name).to eq('New name')
  end
end

RSpec.describe 'DELETE /subtype/id', type: :request do
  before do
    subtype = FactoryBot.create(:subtype)
    option1 = FactoryBot.create(:option, subtype_id: subtype.id)
    option2 = FactoryBot.create(:option, subtype_id: subtype.id)
    delete "/subtypes/#{subtype.id}/options/#{option1.id}"
  end
  
  it 'deletes subtype' do
    expect(Option.count).to eq(1)
  end
end