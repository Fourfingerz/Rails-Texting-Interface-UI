class RemoveRecipientIdFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :recipient_id, :integer
  end
end
