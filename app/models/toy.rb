class Toy < ApplicationRecord
  CATEGORY =["0-2 ans", "2-4 ans", "5-7 ans", "8-12 ans"]
  belongs_to :user
  has_many :rents
  validates :name, :description, :unit_price, :category, presence: true
  validates :unit_price, numericality: true
  validates_inclusion_of :category, in: CATEGORY
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description_and_category,
    against: [ :name, :description, :category ],
    using: {
    tsearch: { prefix: true }
  }
end
