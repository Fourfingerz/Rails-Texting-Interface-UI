class TasksController < ApplicationController

  before_filter :authorize, only: [:new]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def new
    @task = Task.new
    @user = current_user
    @recipients = @user.recipients
  end

  def create
    @task = Task.new(task_params)  
    @task.user_id = current_user.id
    if @task.save
      redirect_to user_path(session[:user_id])  
  	else
  	  render 'new'
  	end
  end

  private 

  def task_params
    params.require(:task).permit(:activity, :message, :user_id, :recipient_id, :schedule_time, :delayed_job_id, :completed)
  end

end
