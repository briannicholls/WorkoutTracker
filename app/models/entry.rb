class Entry < ApplicationRecord
  belongs_to :counter
  belongs_to :user
  accepts_nested_attributes_for :counter

  validates :quantity, presence: true
end
