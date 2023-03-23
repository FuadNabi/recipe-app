require 'rails_helper'

RSpec.describe 'Food page view', type: :feature do
  describe 'Food index page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Index content of food page' do
      visit "/foods"
      expect(page).to have_content('Foods')
      expect(page).to have_content('Home')
      expect(page).to have_content('Food Measurement unit Unit price Quantity Actions')
      expect(page).to have_content(@food.name)
      expect(page).to have_content(@food.price)
      expect(page).to have_content(@food.measurement_unit)
      expect(page).to have_content('Delete')
      expect(page).to have_content('Add Food')

      click_link('Home')
      sleep(5)
      expect(page).to have_current_path('/')

      visit "/foods"
      click_button('Delete')
      expect(page).to have_no_content(@food.name)

      click_link('Add Food')
      expect(page).to have_current_path(new_food_path)
    end
  end
end