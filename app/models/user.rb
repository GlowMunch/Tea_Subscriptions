class User < ApplicationRecord
  has_many :subscriptions
  has_many :teas, through: :subscriptions

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
end
