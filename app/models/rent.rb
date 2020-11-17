class Rent < ApplicationRecord
  belongs_to :toy
  belongs_to :user

  validates :duration, :price, presence: true
end
