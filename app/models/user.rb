class User < ApplicationRecord
  validates :name, presence: true

  has_many :lists
  has_many :groups
end
