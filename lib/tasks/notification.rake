namespace :notification do
  desc 'Sends sms notification to employees asking them to log if they have overtime or not'
  task sms: :environment do
    exit if weekend?

    msg = "Please log into the time tracking dashboard to submit your hours for yesterday: https://example.com"
    users = User.where(type: nil)
    users.each do |user|
      AuditLog.create!(user_id: user.id)
      Sms.send(number: user.phone, message: msg)
      # FakeSms.send(number: user.phone, message: msg)
    end
  end

  desc 'Sends mail notification to managers (admin users) each day to inform of pending overtime requests'
  task manager_email: :environment do
    posts = Post.submitted
    exit if posts.count == 0

    admins = AdminUser.all
    admins.each do |admin|
      ManagerMailer.email(admin).deliver_later
    end
  end

  private

    def weekend?
      Time.now.sunday? || Time.now.saturday?
    end
end
