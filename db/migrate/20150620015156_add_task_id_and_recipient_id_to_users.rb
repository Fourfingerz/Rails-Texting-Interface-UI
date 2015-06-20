class AddTaskIdAndRecipientIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recipient_id, :integer
    add_column :users, :task_id, :integer
  end
end
