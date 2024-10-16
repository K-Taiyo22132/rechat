require "csv"

def self.reset_pk_sequence(table_name)
  case ActiveRecord::Base.connection.adapter_name
  when 'SQLite'
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='#{table_name}'")
  end
end
Occupation.delete_all
reset_pk_sequence("occupations")

CSV.foreach("db/occupations.csv",headers: true) do |row|
  Occupation.create(
    name: row["name"]
  )
end