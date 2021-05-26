FactoryBot.define do
  factory :user do
    first_name { 'Alice' }
    last_name { 'Carroll' }
    email { 'test@test.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'User' }
    email { 'admin@user.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end