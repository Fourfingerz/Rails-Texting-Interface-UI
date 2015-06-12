class UsersController < ApplicationController
  def index
    @users = User.all.order(name: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "New User Created!"
      redirect_to users_index_url
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
    params.require(:user).permit(:email, :name)
  end
end
