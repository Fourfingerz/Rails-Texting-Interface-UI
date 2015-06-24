class TasksController < ApplicationController

  before_filter :authorize, only: [:new]

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @recipients = Recipient.joins(:ownerships).where(user_id = current_user.id) 
    if @task.save
      flash[:success] = "Task Scheduled!"
      redirect_to user_path(session[:user_id])  
    else
      render 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @recipients = Recipient.where(:user_id => session[:user_id])
    if @task.update_attributes(task_params)
      flash[:success] = "Task Updated!"
      redirect_to user_path(session[:user_id])
    else
      render :edit
    end
  end


  private 

  def task_params
    params.require(:task).permit(:activity, :message, :user_id, :schedule_time, :delayed_job_id, :completed, :recipients => [])
  end

end
