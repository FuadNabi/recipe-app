class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, :preparation_time, :cooking_time, :description, presence: true

  def total_price
    foods.sum(:price)
  end
end
