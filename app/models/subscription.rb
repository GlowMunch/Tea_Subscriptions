class Subscription < ApplicationRecord
  belongs_to :user
  has_many :teas
end
