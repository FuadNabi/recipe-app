class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes([:user], [:recipe_foods]).where(public: true).order(created_at: :desc)
  end
end