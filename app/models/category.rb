class Category < ApplicationRecord
  has_many :products
  has_many :products, dependent: :destroy
end
