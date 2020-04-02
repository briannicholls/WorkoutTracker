class User < ApplicationRecord
  has_secure_password
  has_many :counters
  has_many :entries, through: :counters

  def name
    "#{first_name} #{last_name}"
  end
end
