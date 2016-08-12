class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_attachment :photo
  validates :name, uniqueness: true, presence: true
end
