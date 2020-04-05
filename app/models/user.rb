class User < ApplicationRecord
  has_secure_password
  has_many :entries
  has_many :counters, through: :entries

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

# return array of top Users for a Counter
  def self.all_by_grand_total(counter)
    User.where(counter_id: counter.id).order("quantity DESC").limit(1)
  end

  def grand_total(counter)
    Entry.where(counter_id: counter.id, user_id: self.id).sum(:quantity)
  end

  def todays_total(counter)
    entries.today.where('counter_id = ?', counter.id).reduce(0) { |sum , e|
      sum + e.quantity
    }
  end

  def week_total(counter)
    entries.week.where(counter_id: counter.id).reduce(0) { |sum, e|
      sum + e.quantity
    }
  end

  def day_total(counter)
    entries.today.where('counter_id = ?', counter.id).sum(:quantity)
  end

  def self.weekly_tops(counter)
    # return array of users
  end

  # def user_tops(counter)
  #   self.entries.select{|e| e.counter == counter}.sum(:quantity)
  # end

end
