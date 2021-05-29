require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'has a status that can be edited on the form by an admin' do
      visit edit_post_path(@post)

      choose 'post_status_approved'
      click_on 'Save'

      expect(@post.reload.status).to eq('approved')
    end

    it 'cannot be edited by non admin' do
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      visit edit_post_path(@post)
      expect(current_path).to_not have_content('Approved')
    end

    it 'cannot be edited by creator if status approved' do
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      @post.update(user_id: user.id, status: 'approved')

      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end
end