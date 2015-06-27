class AddPhoneToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :phone, :string
  end
end
