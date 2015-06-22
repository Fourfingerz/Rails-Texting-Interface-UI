class AddRecipientIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :recipient_id, :integer
  end
end
