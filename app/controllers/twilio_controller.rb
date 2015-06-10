class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  # Usually enabled to prevent Cross-Site-Forgery Attacks
  # Disabled for this controller
  skip_before_action :verify_authenticity_token

  def voice
  	response = Twilio::TwiML::Response.new do |r|
  	  r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4'
  	    r.Play 'http://linode.rabasa.com/cantina.mp3'
    end
    render_twiml response
  end
end
