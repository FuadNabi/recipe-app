require 'rails_helper'

RSpec.describe 'Home page view', type: :feature do
  describe 'Home index page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Show content of home page' do
      visit "/"
      expect(page).to have_content('Sign out')
      expect(page).to have_content('Recipe App')
      expect(page).to have_content('Foods')
      expect(page).to have_content('User\'s Recipes')
      expect(page).to have_content('Public Recipes')
      expect(page).to have_content('Shopping List')

      click_link('Foods')
      sleep(5)
      expect(page).to have_current_path(foods_path)

      visit "/"
      click_link('User\'s Recipes')
      sleep(5)
      expect(page).to have_current_path(recipes_path)

      visit "/"
      click_link('Public Recipes')
      sleep(5)
      expect(page).to have_current_path(public_recipes_path)
      
      visit "/"
      click_link('Shopping List')
      sleep(5)
      expect(page).to have_current_path(general_shopping_list_path)
    end
  end
end