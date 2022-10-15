class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities

  validates :name, :icon, presence: true

  def name_with_icon
    "#{icon} #{name}"
  end

  def total_amount
    entities.sum(:amount)
  end

  def self.icon_list
    ['✈️', '🍔', '🛍️', '🥕', '💰', '💅', '🍹', '🎁', '🏥', '🏠', '🚋', '🚰']
  end
end
