class CreateStoreReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :store_reviews do |t|
      t.string :title
      t.binary :review_image
      t.text :review
      t.integer :evaluation
      t.string :spot
      t.string :tell
      t.integer :category_id
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
