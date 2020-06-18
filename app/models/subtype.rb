class Subtype < ApplicationRecord
  has_many :options, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
end
