class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient

  # Sends a text message using secrets ENV and relays to twilio
  def send_text_message
  	number_to_send_to = '13473063012'
    twilio_phone = ENV["TWILIO_PHONE_NUM"]
    twilio_account_sid = Rails.application.secrets.twilio_account_sid
    twilio_auth_token = Rails.application.secrets.twilio_auth_token

    @client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

  	@message = @client.messages.create( 
      :from => twilio_phone,
  	  :to   => number_to_send_to,
  	  :body => 'What a piece of work is a man! How noble in reason, how infinite in faculty, in form and moving how express and admirable, in action how like an angel, in apprehension how like a god -- the beauty of the world, the paragon of animals!'
      )

    render plain: @message.status
  end

  def delayed_job
    Delayed::Job.find(delayed_job_id)
  end

  def schedule_texting
    job = self.delay(run_at: self.schedule_time).send_text_message
    update_column(:delayed_job_id, job.id)
  end
end
