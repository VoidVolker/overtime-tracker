require 'rails_helper'

describe User, type: :model do
  before do
    @user = User.create(
      email: 'test@test.test',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Alice',
      last_name: 'Carroll'
    )
  end

  describe 'Creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name, last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name that combines first and lest name' do
      expect(@user.full_name).to eq('Carroll, Alice')
    end
  end
end
