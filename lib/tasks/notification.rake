namespace :notification do
  desc 'Sends sms notification to employees asking them to log if they have overtime or not'
  task sms: :environment do
    # 1. Schedule to run at 5pm
    # 2. Iterate over all employees
    # 3. Skip admin users
    # 4. Send a message that has instructions and a link to log time
    # User.where(type: nil).each do |user|
    #   Sms.send(number: user.phone, message: msg)
    # end
  end

  desc 'Sends mail notification to managers (admin users) each day to inform of pending overtime requests'
  task manager_email: :environment do
    posts = Post.submitted
    return if posts.count == 0
    admins = AdminUser.all

    admins.each do |admin|
      ManagerMailer.email(admin).deliver_later
    end
  end
end
