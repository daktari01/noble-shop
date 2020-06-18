FactoryBot.define do
  factory :subtype do
    name { Faker::Commerce.unique.department(max: 1) }
  end
end