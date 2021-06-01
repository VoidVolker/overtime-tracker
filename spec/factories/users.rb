FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  sequence :user_name do |n|
    "Alice №#{n}"
  end

  factory :user do
    first_name { generate :user_name }
    last_name { 'Carroll' }
    email { generate :email }
    phone { '1234567890' }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'Admin' }
    email { generate :email }
    phone { '1234567890' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end