class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  	@task = Task.new
    @user = User.first
    @recipients = Recipient.all
  end

  def create
  	@task = Task.new(task_params)
  	@task.user = User.first
  	
    if @task.save
      redirect_to tasks_url  
  	else
  	  render 'new'
  	end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @user = User.first
    @recipients = @user.recipients
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

  private 

  def task_params
    params.require(:task).permit(:name, :description, :text_message_body, :user_id, :recipient_id, :schedule_time, :delayed_job_id, :completed)
  end

end
