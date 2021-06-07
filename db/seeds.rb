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

posts_count = 100
posts_count.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} rationale content",
    user_id: @user.id,
    overtime_request: 2.5
  )
end
puts "#{posts_count} Posts have been created"

logs_count = 10
log_date = Date.today - logs_count.weeks
logs_count.times do |post|
  AuditLog.create!(
    user_id: @user.id,
    started: log_date
  )
  log_date += 1.week
end
puts "#{logs_count} Audit logs have been created"
