class RemoveTaskIdFromRecipients < ActiveRecord::Migration
  def change
    remove_column :recipients, :task_id, :integer
  end
end
