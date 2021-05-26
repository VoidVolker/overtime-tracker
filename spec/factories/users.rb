FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name { 'Alice' }
    last_name { 'Carroll' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
  end
end