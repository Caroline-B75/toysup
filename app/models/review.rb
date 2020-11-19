class Review < ApplicationRecord
  RATING = [1, 2, 3, 4, 5]
  belongs_to :toy
  validates :content, :quality_rating, :security_rating, :fun_rating, presence: true
  validates_inclusion_of :quality_rating, :security_rating, :fun_rating, in: RATING
end
