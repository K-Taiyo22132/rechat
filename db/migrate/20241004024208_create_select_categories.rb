class CreateSelectCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :select_categories do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
