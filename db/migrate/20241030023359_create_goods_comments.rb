class CreateGoodsComments < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_comments do |t|
      t.string :comment
      t.integer :goods_review_id
      t.integer :user_id
      t.integer :evaluation

      t.timestamps
    end
  end
end
