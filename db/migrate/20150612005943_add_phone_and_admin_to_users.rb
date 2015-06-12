class AddPhoneAndAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :admin, :boolean
  end
end
