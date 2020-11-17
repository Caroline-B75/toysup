class Toy < ApplicationRecord
  CATEGORY =["Puériculture et jouets 0-2 ans", "Jouets 2-4 ans", "Jouets 5-7 ans", "Jouets 8-12 ans", "Jeux d'éveil", "Jeux d'imagination", "Loisirs créatifs", "Jeux de construction", "Jeux de société", "Jeux éducatifs", "Jeux Plein air", "Musique"]
  belongs_to :user
  has_many :rents
  validates :name, :description, :unit_price, :category, presence: true
  validates :unit_price, numericality: true
  validates_inclusion_of :category, in: CATEGORY
  # has_one_attached :photo
end
