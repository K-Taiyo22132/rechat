class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.binary :group_image
      t.text :introduction
      t.integer :category_id

      t.timestamps
    end
  end
end
