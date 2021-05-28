@user = User.create(
  email: 'test@test.test',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Alice',
  last_name: 'Carroll'
)
puts '1 user created'

AdminUser.create(
  email: 'admin@t.t',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Admin',
  last_name: 'Admin'
)
puts '1 admin user created'


100.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} rationale content",
    user_id: @user.id
  )
end
puts '100 Posts have been created'