class Category < ApplicationRecord
  has_many :products
  has_many :products, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
end
