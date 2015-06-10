class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.text :text_message_body
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
