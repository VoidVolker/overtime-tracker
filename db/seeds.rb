@user = User.create!(
  email: 'test@t.t',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Alice',
  last_name: 'Carroll',
  phone: '1234567890'
)

@user_two = User.create!(
  email: 'test2@t.t',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'User 2',
  last_name: 'User 2',
  phone: '1234567890'
)
puts '2 users created'

AdminUser.create!(
  email: 'admin@t.t',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Admin',
  last_name: 'Admin',
  phone: '1234567890'
)
puts '1 admin user created'


10.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} rationale content",
    user_id: @user.id,
    overtime_request: 2.5
  )
end
puts '10 Posts have been created'

10.times do |post|
  AuditLog.create!(
    user_id: @user.id
  )
end
puts '10 Audit logs have been created'