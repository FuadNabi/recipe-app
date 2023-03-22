class ShoppingListController < ApplicationController
  def index
    @food_amount = 0
    @total_price = 0
    @recipe_foods = []
    @need_foods = RecipeFood.where(recipe_id: params[:recipe_id] )
    @need_foods.each do |need_food|
      new_food_id = need_food.food_id
      new_val = Food.where(user: current_user).where(id: new_food_id).first.quantity
      quantity_needed = new_val - need_food.quantity
      if quantity_needed >= 0
        next
      else
        need_food.quantity = quantity_needed * -1
      end
      @recipe_foods << need_food
    end
    @recipe_foods.each do |f|
      @total_price += f.food.price * f.quantity
    end
  end
end