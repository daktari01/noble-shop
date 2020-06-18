FactoryBot.define do
  factory :option do
    name { Faker::Commerce.unique.color }
    subtype
  end
end