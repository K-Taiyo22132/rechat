class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :occupation_id
      t.binary :profile_image
      t.integer :gender
      t.text :introduction

      t.timestamps
    end
  end
end
