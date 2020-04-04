class Entry < ApplicationRecord
  belongs_to :counter
  belongs_to :user
  accepts_nested_attributes_for :counter

  validates :quantity, presence: true

  # Select * from entries where user = ? and counter = ?
  #scope :leaders, -> {}

  #scope :today, -> { where(created_at: )}

  #scope :grand_total, -> { Entry.where(user_id: self.id).order('quantity DESC').limit(1) }

  scope :all_by_quantity, -> {Entry.order('quantity DESC')}

  def user_total(counter, user)
    Entry.where(counter_id: counter.id, user_id: user.id).sum(:quantity)
  end

end
