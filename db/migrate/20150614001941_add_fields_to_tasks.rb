class AddFieldsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :activity, :string
    add_column :tasks, :message, :text
  end
end
