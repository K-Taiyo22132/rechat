class CreateSelectReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :select_reviews do |t|
      t.integer :goods_review_id
      t.integer :store_review_id

      t.timestamps
    end
  end
end
