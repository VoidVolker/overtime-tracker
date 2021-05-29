@user = User.create(
  email: 'test@test.test',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Alice',
  last_name: 'Carroll'
)

@user_two = User.create(
  email: 'test2@test.test',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'User 2',
  last_name: 'User 2'
)
puts '2 user created'

AdminUser.create(
  email: 'admin@t.t',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Admin',
  last_name: 'Admin'
)
puts '1 admin user created'


10.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} rationale content",
    user_id: @user.id
  )
end
puts '10 Posts have been created'