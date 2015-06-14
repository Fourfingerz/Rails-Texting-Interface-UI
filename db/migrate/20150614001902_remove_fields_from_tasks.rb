class RemoveFieldsFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :name, :string
    remove_column :tasks, :description, :text
    remove_column :tasks, :text_message_body, :text
  end
end
