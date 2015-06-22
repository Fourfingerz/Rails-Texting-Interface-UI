class RemoveRecipientIdAndTaskIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :recipient_id, :integer
    remove_column :users, :task_id, :integer
  end
end
