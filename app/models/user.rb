class User < ApplicationRecord
  has_many :toys
  has_many :rents, through: :toys
  has_many :rents
  has_many :reviews, through: :toys
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
