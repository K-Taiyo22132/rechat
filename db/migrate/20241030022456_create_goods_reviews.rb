class CreateGoodsReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_reviews do |t|
      t.string :title
      t.binary :review_image
      t.text :review
      t.integer :evaluation
      t.integer :price
      t.integer :category_id
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
