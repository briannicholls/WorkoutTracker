class User < ApplicationRecord
  has_secure_password
  has_many :counters
  has_many :entries, through: :counters

  def name
    "#{first_name} #{last_name}"
  end

  # sum qty of entries for usercounter
  def grand_total(counter)
    Entry.where(user_id: self.id, counter_id: counter.id).sum(:quantity)
  end

  def method_name

  end

end
