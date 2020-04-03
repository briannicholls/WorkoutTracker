class Counter < ApplicationRecord
  has_many :users
  has_many :entries

  validates :title, presence: true, uniqueness: true
end
