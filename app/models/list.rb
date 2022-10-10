class List < ApplicationRecord
  
  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }

  belongs_to :user
  has_and_belongs_to_many :groups
end
