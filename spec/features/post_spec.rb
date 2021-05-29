require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, user_id: @user.id)
    @post2 = FactoryBot.create(:second_post, user_id: @user.id)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      visit posts_path
      expect(page).to have_content(/rationale1|rationale2/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit posts_path

      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      visit posts_path

      click_link("delete_#{@post1.id}")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User_Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User_Association')
    end
  end

  describe 'edit' do
    before do
      @post3 = FactoryBot.create(:post, user_id: @user.id)
    end

    # it 'can be reached by clicking edit on index page' do
    #   visit posts_path

    #   click_link "edit_#{@post.id}"
    #   expect(page.status_code).to eq(200)
    # end

    it 'can be edited' do
      visit edit_post_path(@post3)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content('Edited content')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      @non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(@non_authorized_user, :scope => :user)

      visit edit_post_path(@post3)

      expect(current_path).to eq(root_path)
    end
  end
end
