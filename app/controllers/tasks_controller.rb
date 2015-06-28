class TasksController < ApplicationController

  before_filter :authorize, only: [:new]
  respond_to :html, :json

  def new  # page for CREATE
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      @task.ownerships.create(:task_id => @task.id)
      flash[:success] = "Task Scheduled!"
      redirect_to task_edit_recipients_path(:id => @task.id)
    else
      render 'new'
    end
  end



  def show  # page for sms
    @task = Task.find(params[:id])
    #pry 
  end

  def sms  # Send SMS to task recipients
    @task = Task.find_by_id(params[:id])
    message = @task.message
    @phones = @task.recipients.map(&:phone)

    # Running model on an INSTANCE of not actual MODEL itself
    @task.schedule_sending_text  
    flash[:notice] = "Task scheduled!"
  end



  def edit # page for UPDATE
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      #flash[:success] = "Task Updated!"
      #redirect_to user_path(current_user.id)
      redirect_to task_path(@task.id)
    else
      render :edit
    end
  end



  def edit_recipients # page for UPDATE_RECIPIENTS
    @task = Task.find(params[:id])
  end

  def update_recipients
    @task = Task.find(params[:id])

    # respond_to do |format|
    #   if @task.update_attributes(task_params)
    #     format.html { redirect_to user_path(current_user.id), notice: 'Recipient list updated!' }
    #   else
    #     format.html { render action: "edit_recipients" }
    #   end
    # end

    if @task.save
      flash[:success] = "Recipients added to task."
      redirect_to user_path(current_user.id)
    else
      render 'edit_recipients'
    end
  end


  private 

  def task_params
    params.require(:task).permit(:activity, :message, :phone,
                                 :schedule_time, :delayed_job_id, :completed,
                                 :recipient_ids => [])
  end
end
