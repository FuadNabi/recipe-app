require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
    @recipe = Recipe.create!(user: @user, name: 'Ground beef', preparation_time: '10 min', cooking_time: '45 min',
                             description: 'Lorem ipsum', public: true)
            
    @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)
    @ingredient = RecipeFood.create!(quantity: 1, recipe_id: @recipe.id, food_id: @food.id)
  end

  context 'Testing validations' do
    it 'Recipe is not valid without a name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'Recipe is a valid with a name' do
      expect(@recipe).to be_valid
    end

    it 'Recipe is not valid without a preparation time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'Recipe is a valid with a preparation time' do
      expect(@recipe).to be_valid
    end

    it 'Recipe is not valid without a cooking time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'Recipe is a valid with a cooking time' do
      expect(@recipe).to be_valid
    end
    
    it 'Recipe is not valid without a description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'Recipe is a valid with a description' do
      expect(@recipe).to be_valid
    end
  end
end
