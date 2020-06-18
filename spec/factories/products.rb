FactoryBot.define do
  factory :product do
    subtype { Faker::Commerce.color }
    price { Faker::Commerce.price }
    quantity { Faker::Number.between(from: 1, to: 100) }
    category
  end
end