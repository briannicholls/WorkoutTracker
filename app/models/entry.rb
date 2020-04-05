class Entry < ApplicationRecord
  belongs_to :counter
  belongs_to :user
  accepts_nested_attributes_for :counter

  validates :quantity, presence: true, numericality: {greater_than: 0}

  scope :all_by_quantity, -> {Entry.order('quantity DESC')}
  scope :today, -> {Entry.where('created_at >= ?', 24.hours.ago)}
  scope :week, -> {Entry.where('created_at >= ?', 1.week.ago)}

  def user_total(counter, user)
    Entry.where(counter_id: counter.id, user_id: user.id).sum(:quantity)
  end

  def self.counter_user_entries(counter, user)
    where(counter_id: counter.id, user_id: user.id).order('created_at DESC')
  end

end
