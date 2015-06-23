class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
    @recipients = @user.recipient_ownerships
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id]), notice: "Thank you for signing up!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def following
  end

  def followers
  end

  private 

  def user_params
    params.require(:user).permit(:email, :name, :phone, :admin, :password, :password_confirmation)
  end
end
