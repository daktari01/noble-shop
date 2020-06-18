require 'rails_helper'

describe Product, type: :model do
  let!(:product) { create(:product) }
  it { should validate_presence_of(:subtype) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
end