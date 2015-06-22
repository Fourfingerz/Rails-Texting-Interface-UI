class RemoveUserIdFromRecipients < ActiveRecord::Migration
  def change
    remove_column :recipients, :user_id, :integer
  end
end
