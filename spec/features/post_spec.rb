require 'rails_helper'

describe 'navigate' do
  before do
    @user1 = FactoryBot.create(:user)
    @user1_post1 = FactoryBot.create(:post, user_id: @user1.id)
    @user1_post2 = FactoryBot.create(:post, user_id: @user1.id)

    @user2 = FactoryBot.create(:user)
    @user2_post1 = FactoryBot.create(:post, user_id: @user2.id)

    login_as(@user1, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Overtime requests/)
    end

    it 'has a list of posts' do
      visit posts_path
      expect(page).to have_content(@user1_post1.rationale)
      expect(page).to have_content(@user1_post2.rationale)
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

      click_link("delete_#{@user1_post1.id}")
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
      fill_in 'post[overtime_request]', with: 1.0
      click_on 'Save'

      expect(page).to have_content('Some rationale')
      # expect { click_on 'Save' }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited reationale'
      fill_in 'post[overtime_request]', with: 1.0
      click_on 'Save'

      expect(@user1.posts.last.rationale).to eq('Edited reationale')
    end
  end

  describe 'edit' do
    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_link "edit_#{@user1_post1.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@user1_post2)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content('Edited content')
    end

    it 'cannot be edited by a non authorized user' do
      visit edit_post_path(@user2_post1)

      expect(current_path).to eq(root_path)
    end
  end
end
