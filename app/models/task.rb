class Task < ActiveRecord::Base
  belongs_to :user

  def send_text_message
  	number_to_send_to = recipient.phone

  	twilio_sid = ENV["TWILIO_ACCOUNT_SID"]
  	twilio_token = ENV["TWILIO_AUTH_TOKEN"] 
  	twilio_phone_number = ENV["TWILIO_PHONE_NUM"]

  	@twilio_cilient = Twilio::REST::Client.new twilio_sid, twilio_token

  	@twilio_client.account.sms.messages.create(
  	  :from => "+1#{twilio_phone_number}",
  	  :to   => number_to_send_to,
  	  :body => message
  	)
end
