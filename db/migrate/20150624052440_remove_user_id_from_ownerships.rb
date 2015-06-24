class RemoveUserIdFromOwnerships < ActiveRecord::Migration
  def change
    remove_column :ownerships, :user_id, :integer
    add_column    :ownerships, :task_id, :integer
  end
end
