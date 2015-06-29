class RemovePhoneFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :phone, :string
  end
end
