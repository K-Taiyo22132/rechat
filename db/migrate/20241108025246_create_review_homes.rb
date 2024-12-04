class CreateReviewHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :review_homes do |t|
      t.integer :category_id
      t.integer :goods_review_id
      t.integer :store_review_id
      t.integer :group_id

      t.timestamps
    end
  end
end
