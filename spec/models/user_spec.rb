require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(email: 'max@email.com', password: 'password', name: 'Fuad')
  end

  context 'Testing validations' do
    it 'User is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'User is a valid with a name' do
      expect(@user).to be_valid
    end
  end
end
