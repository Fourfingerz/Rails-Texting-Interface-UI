class TasksController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
  	@task = Task.new
    @user = User.new
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

  private 

  def task_params
    params.require(:task).permit(:name, :description, :text_message_body, :user_id, :recipient_id, :schedule_time, :delayed_job_id, :completed)
  end

end
