require 'rails_helper'

RSpec.describe 'Shopping list page view', type: :feature do
  describe 'Shopping list index page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
      @recipe = Recipe.create!(user: @user, name: 'Ground beef', preparation_time: '10 min', cooking_time: '45 min',
                               description: 'Lorem ipsum', public: true)
      @food = Food.create!(user_id: @user.id, name: 'Apple', measurement_unit: 'kg', price: 10)
      @ingredient = RecipeFood.create!(quantity: 2, recipe_id: @recipe.id, food_id: @food.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Index content of shopping_list page' do
      visit '/shopping_list'
      expect(page).to have_content('General shopping List')
      expect(page).to have_content('Amount of food items to buy: 1')
      expect(page).to have_content('Total value of food needed: $10')
    end
  end
end
