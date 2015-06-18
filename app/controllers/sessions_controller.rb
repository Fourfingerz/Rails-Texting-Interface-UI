class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  	  session[:user_id] = user.user_id
  	  redirect_to root_url, notice: "Logged in"
  	else
  	  flash.now.alert = "Email or password is invalid"
  	  render "new"
  	end
  end

  def destory
  	session[:user_id] = nil
  	redirect_to root_url, notice: "You are now logged out"
  end
  
end