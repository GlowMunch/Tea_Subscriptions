class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :teas

  validates_presence_of :title, :price, :status, :frequency
  enum status: %w(active cancelled)
end
