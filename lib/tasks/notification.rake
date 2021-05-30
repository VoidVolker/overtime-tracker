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
end
