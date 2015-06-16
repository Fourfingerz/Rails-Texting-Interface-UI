class AddTaskIdColumnToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :task_id, :integer
  end
end
