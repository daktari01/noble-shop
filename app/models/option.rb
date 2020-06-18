class Option < ApplicationRecord
  belongs_to :subtype
  validates :name, presence: true
  validates :name, uniqueness: true
end
