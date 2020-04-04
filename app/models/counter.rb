class Counter < ApplicationRecord
  has_many :entries
  has_many :users, through: :entries

  validates :title, presence: true, uniqueness: true

  def today
    entries.select { |e| e.created_at.today? }
  end

  def user_total(user)
    Entry.where(counter_id: self.id, user_id: user.id).sum(:quantity)
  end

  def top_users
    self.users.sort_by{ |e|
      e.grand_total(self)
    }.reverse
  end
end
