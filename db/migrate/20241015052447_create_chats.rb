class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
