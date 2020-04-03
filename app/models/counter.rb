class Counter < ApplicationRecord
  has_many :users
  has_many :entries

  validates :title, presence: true, uniqueness: true

  

  def today
    entries = self.entries
    entries.select { |e| e.created_at.today? }
  end
end
