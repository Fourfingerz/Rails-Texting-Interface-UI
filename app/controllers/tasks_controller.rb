class TasksController < ApplicationController

  before_filter :authorize, only: [:new]

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      @task.ownerships.create(:task_id => @task.id)
      flash[:success] = "Task Scheduled!"
      redirect_to user_path(session[:user_id])  
    else
      render 'new'
    end
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
      flash[:success] = "Task Updated!"
      redirect_to user_path(session[:user_id])
    else
      render :edit
    end
  end

  private 

  def task_params
    params.require(:task).permit(:activity, :message, 
                                 :schedule_time, :delayed_job_id, :completed,
                                 :recipient_ids => [])
  end
end
