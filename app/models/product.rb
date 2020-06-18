class Product < ApplicationRecord
  belongs_to :category
  validates :subtype, :price, :quantity, presence: true
end
