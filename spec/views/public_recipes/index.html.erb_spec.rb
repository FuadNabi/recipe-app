require 'rails_helper'

RSpec.describe 'Public recipes page view', type: :feature do
  describe 'Public recipe index page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
      @recipe = Recipe.create!(user: @user, name: 'Ground beef', preparation_time: '10 min', cooking_time: '45 min',
                               description: 'Lorem ipsum', public: true)
      @recipe_private = Recipe.create!(user: @user, name: 'Private beef', preparation_time: '10 min',
                                       cooking_time: '1h', description: 'Lorem ipsum', public: false)
      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)
      @ingredient = RecipeFood.create!(quantity: 1, recipe_id: @recipe.id, food_id: @food.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Index content of public recipe page' do
      visit public_recipes_path
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content("By: #{@user.name}")
      expect(page).to have_content('Total food items: 1')
      expect(page).to have_content('Total price: $12')

      # Now check if private recipe shows in public recipes page
      expect(page).to have_no_content(@recipe_private.name)

      click_link('Ground beef')
      expect(page).to have_current_path(recipe_path(@recipe.id))
    end
  end
end
