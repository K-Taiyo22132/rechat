require "csv"

def self.reset_pk_sequence(table_name)
  case ActiveRecord::Base.connection.adapter_name
  when 'SQLite'
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='#{table_name}'")
  end
end
Group.delete_all
reset_pk_sequence("groups")

Occupation.delete_all
reset_pk_sequence("occupations")

CSV.foreach("db/occupations.csv",headers: true) do |row|
  Occupation.create!(
    name: row["name"]
  )
end

User.delete_all
reset_pk_sequence("users")

user_icon = nil
image_path = Rails.root.join("public/images/","rails.jpg")
File.open(image_path,"r+b") do |f|
  user_icon = f.read
end

CSV.foreach("db/users.csv",headers: true) do |row|
  User.create!(
    email: row["email"],
    password: row["password_digest"],name: row["name"],
    occupation_id: row["occupation_id"],profile_image:user_icon,
    introduction:row["introduction"]
  )
end

Category.delete_all
reset_pk_sequence("categories")


count = 1
CSV.foreach("db/categories.csv",headers: true) do |row|
  category_icon = nil
image_path = Rails.root.join("public/images/","category#{count}.jpg")
File.open(image_path,"r+b") do |f|
  category_icon = f.read
end
  Category.create!(
    name: row["name"],category_image: category_icon,

  )
    count = count+1
end
