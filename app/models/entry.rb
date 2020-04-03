class Entry < ApplicationRecord
  belongs_to :counter
  accepts_nested_attributes_for :counter

  validates :quantity, presence: true
end
