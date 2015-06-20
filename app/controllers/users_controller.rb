class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
    # Find recipients whose task_id equals listed task
    @recipients = @user.recipients
    # @recipients = params[:task_id].present? ?
    #   @user.tasks.joins(:tasks).where(tasks: {name: params[:task_id]}) :
    #   @user.tasks
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
