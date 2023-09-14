class Subscription < ApplicationRecord
  belongs_to :user
  has_many :teas

  enum status: %w(active cancelled)
end
