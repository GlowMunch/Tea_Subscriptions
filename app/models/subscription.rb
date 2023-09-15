class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :teas

  enum status: %w(active cancelled)
end
