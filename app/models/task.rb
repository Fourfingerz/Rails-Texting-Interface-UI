class Task < ActiveRecord::Base
  belongs_to :user

  # Sends a text message using Figaro environment and relays to twilio
  def send_text_message
  	number_to_send_to = 'SECRET'
    twilio_num = 'SECRET'
    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

  	@message = @client.messages.create( 
      :from => twilio_num,
  	  :to   => number_to_send_to,
  	  :body => 'Hi I\'m a computer. I\'m pretty stupid, but JC can make me send texts and X_X faces. <3'
      )
    
    render plain: @message.status
  end
end
