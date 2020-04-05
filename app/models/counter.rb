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

  def users_by_grand_total
    self.users.uniq.sort_by{ |e|
      -e.grand_total(self)
    }
  end

  def users_by_week_total
    self.users.sort_by{ |e|
      e.week_total(self)
    }.uniq.reverse
  end

  def users_by_day_total
    self.users.uniq.sort_by{ |e|
      -e.day_total(self)
    }
  end
end
