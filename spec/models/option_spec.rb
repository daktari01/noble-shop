require 'rails_helper'

describe Option, type: :model do
  let!(:option) { create(:option) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end