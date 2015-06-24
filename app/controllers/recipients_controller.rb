class RecipientsController < ApplicationController
  def index
    @recipients = Recipient.all
  end
  
  def new
  	@recipient = Recipient.new
  end

  def create
  	@recipient = current_user.recipients.build(recipient_params)
  	if @recipient.save
      #@recipient.ownerships.create(user_id: current_user.id)
      flash[:success] = "Recipient created!"
  	  redirect_to user_path(session[:user_id])
  	else
  	  render 'new'
  	end
  end

  def update
    @recipients.update(recipient_params)
  end

  private

  def recipient_params
  	params.require(:recipient).permit(:name, :email, :phone, :user_ownerships_attributes => [:user_id])
  end
end
