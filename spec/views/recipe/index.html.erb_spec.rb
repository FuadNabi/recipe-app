require 'rails_helper'

RSpec.describe 'Recipe page view', type: :feature do
  describe 'Recipe index page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
      @recipe = Recipe.create!(user: @user, name: 'Ground beef', preparation_time: '10 min', cooking_time: '45 min',
                               description: 'Lorem ipsum', public: true)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Index content of recipe page' do
      visit '/recipes'
      expect(page).to have_content('Recipes')
      expect(page).to have_content("Recipe #{@recipe.id}")
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.description)
      expect(page).to have_content('Remove')

      click_link(@recipe.name)
      expect(page).to have_current_path(recipe_path(@recipe.id))

      visit '/recipes'
      click_link('Add Recipe')
      expect(page).to have_current_path(new_recipe_path)
    end
  end
end
