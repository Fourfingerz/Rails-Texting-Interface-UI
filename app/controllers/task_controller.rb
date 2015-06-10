class TaskController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
  	@task = Task.new
  	@task.send_text_message
  end

end
