class AddUserToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :user_id, :integer
  end
end
