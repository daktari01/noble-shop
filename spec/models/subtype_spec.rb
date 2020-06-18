require 'rails_helper'

describe Subtype, type: :model do
  let!(:subtype) { create(:subtype) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end