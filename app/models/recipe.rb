class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, :preparation_time, :cooking_time, :description, presence: true

  def total_price
    def total_price
      total = 0
      recipe_foods.each do |recipe_food|
        total += recipe_food.quantity * recipe_food.food.price
      end
      total
    end
  end
end
