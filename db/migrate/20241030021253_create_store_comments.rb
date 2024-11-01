class CreateStoreComments < ActiveRecord::Migration[6.1]
  def change
    create_table :store_comments do |t|
      t.string :comment
      t.integer :store_review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
