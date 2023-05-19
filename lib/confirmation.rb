require 'twilio-ruby'

class Confirmation
  def initialize
    @twilio_sid = ENV["TWILIO_SID"]
    @twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    @twilio_number = ENV["TWILIO_PHONE_NUMBER"]
    @my_number = ENV["MY_PHONE_NUMBER"]
  end
  
  def send(order, phone_number)
    fail "No phone number provided" if phone_number.empty?

    @client = Twilio::REST::Client.new @twilio_sid, @twilio_token
    message = @client.messages.create(
      body: "Order #{order.order_id} is on its way!",
      to: phone_number,  # Text this number
      from: @twilio_number, # From a valid Twilio number
    )
    return message.sid
  end
end
