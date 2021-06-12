module FakeSms
  Message = Struct.new(:number, :message)
  @messages = []

  def self.send(number:, message:)
    @messages << Message.new(number, message)
    puts "FakeSms.send: #{number} -> #{message}"
  end

  def self.messages
    @messages
  end
end