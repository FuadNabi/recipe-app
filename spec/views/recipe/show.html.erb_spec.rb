require 'rails_helper'

RSpec.describe 'Recipe page view', type: :feature do
  describe 'REcipe show page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
      @recipe = Recipe.create!(user: @user, name: 'Ground beef', preparation_time: '10 min', cooking_time: '45 min', description: 'Lorem ipsum', public: true)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Show content of recipe page' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_content("Recipe: #{@recipe.name}")
      expect(page).to have_content("Preparation time: #{@recipe.preparation_time}")
      expect(page).to have_content("Cooking time: #{@recipe.cooking_time}")
      expect(page).to have_content("Public")
      expect(page).to have_content("Steps: #{@recipe.description}")
      expect(page).to have_content("Generate shopping list")
      expect(page).to have_content("Add Ingredient")
      expect(page).to have_content("No foods added to recipe yet.")

      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)
      @ingredient = RecipeFood.create!(quantity: 1, recipe_id: @recipe.id, food_id: @food.id)

      click_link('Generate shopping list')
      expect(page).to have_current_path(shopping_list_path(@recipe.id))

      visit "/recipes/#{@recipe.id}"
      click_link('Add Ingredient')
      expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe.id))

      visit "/recipes/#{@recipe.id}"
      expect(page).to have_no_content("No foods added to recipe yet.")
      expect(page).to have_content("Food Quantity Value Actions")
      expect(page).to have_content(@food.name)
      expect(page).to have_content(@ingredient.quantity)
      expect(page).to have_content("12$")
      expect(page).to have_content("Remove")
    end
  end
end