require 'rails_helper'

# describe 'Homepage', :js => true do
describe 'Homepage' do
  it 'allows the admin to approve posts from the homepage' do
    post = FactoryBot.create(:post)
    admin_user = FactoryBot.create(:admin_user)
    login_as(admin_user, :scope => :user)


    # visit root_path
    # click_button("approve_#{post.id}")

    visit approve_post_path(post)

    expect(post.reload.status).to eq('approved')
  end
end
