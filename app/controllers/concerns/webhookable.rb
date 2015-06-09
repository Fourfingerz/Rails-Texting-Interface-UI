module Webhookable
extend ActiveSupport::Concern

  # Sets HTTP response content type to "text/xml"
  def set_header
  	response.headers["Content-Type"] = "text/xml"
  end

  # Renders the TwiML object to raw XML
  def render_twiml(response)
  	render text: response.text
  end
end