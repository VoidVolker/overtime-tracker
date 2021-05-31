module Sms
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  # phone_number = ENV['TWILIO_PHONE_NUMBER']

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send(number:, message:)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+#{num}",
      body: "#{message}"
    )
    # puts "Sending sms: #{number} -> '#{message}'"
  end
end