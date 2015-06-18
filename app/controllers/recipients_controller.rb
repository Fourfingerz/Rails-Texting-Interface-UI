class RecipientsController < ApplicationController
  def new
  	@recipient = Recipient.new
  end

  def create
    @user = User.first
  	@recipient = @user.recipients.build(recipient_params)
  	if @recipient.save
  	  redirect_to recipients_index_url
  	else
  	  render 'new'
  	end
  end

  def index
    @recipients = Recipient.all
  end

  private

  def recipient_params
  	params.require(:recipient).permit(:name, :email, :phone)
  end
end
