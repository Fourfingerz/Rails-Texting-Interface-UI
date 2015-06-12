class AddRecipientScheduleDelayedJobToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :recipient_id, :integer
    add_column :tasks, :schedule_time, :datetime
    add_column :tasks, :delayed_job_id, :integer
  end
end
