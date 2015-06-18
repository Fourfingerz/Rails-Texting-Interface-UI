class RecipientsController < ApplicationController
  def new
  	@recipient = Recipient.new
  end

  def create
  	@recipient = Recipient.new(recipient_params)
    @recipient.user_id = current_user.id
  	if @recipient.save
  	  redirect_to user_path(session[:user_id])
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
