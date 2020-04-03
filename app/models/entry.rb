class Entry < ApplicationRecord
  belongs_to :counter
  belongs_to :user
  accepts_nested_attributes_for :counter

  validates :quantity, presence: true

  # Select * from entries where user = ? and counter = ?
  #scope :leaders, -> {}

  #scope :today, -> { where(created_at: )}


end
