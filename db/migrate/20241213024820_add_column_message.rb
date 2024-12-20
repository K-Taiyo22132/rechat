class AddColumnMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :chat_id, :integer
  end
end
