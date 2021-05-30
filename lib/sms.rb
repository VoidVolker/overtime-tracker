module Sms
  def self.send(number:, message:)
    puts "Sending sms: #{number} -> '#{message}'"
  end
end