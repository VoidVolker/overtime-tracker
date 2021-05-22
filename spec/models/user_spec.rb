require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creation' do
    before do
      @user = User.create(
        email: 'test@test.test',
        password: '123456',
        password_confirmation: '123456',
        first_name: 'Alice',
        last_name: 'Carroll'
      )
    end

    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name, last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
