class TasksController < ApplicationController

  before_filter :authorize, only: [:new]

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @recipients = Recipient.where(:user_id => session[:user_id])
    if @task.update_attributes(task_params)
      redirect_to user_path(session[:user_id])
    else
      render :edit
    end
  end

  def new
    @task = Task.new
    @user = current_user
    @recipients = @user.recipient_ownerships
  end

  def create
    @task = current_user.tasks.build(task_params)  
    if @task.save
      flash[:success] = "Task Scheduled!"
      redirect_to user_path(session[:user_id])  
  	else
  	  render 'new'
  	end
  end

  private 

  def task_params
    params.require(:task).permit(:activity, :message, :user_id, :schedule_time, :delayed_job_id, :completed, :recipient_id => [] )
  end

end
