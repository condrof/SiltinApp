# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

end

Fabricator(:supplier) do
  email { Faker::Internet.safe_email }
  created_at { DateTime.now }
  updated_at { DateTime.now }
  password { "testtest" }
end

Fabricator(:product) do
  name { Faker::Company.name }
  created_at { DateTime.now }
  updated_at { DateTime.now }
end

Fabricator(:inventory) do
  product_id { rand(1..50) }
  supplier_id { rand(1..10) }
  price { rand(1..150)* rand() }
  created_at { DateTime.now }
  updated_at { DateTime.now }
end

Fabricator(:unit) do
  created_at { DateTime.now }
  updated_at { DateTime.now }
end


10.times { Fabricate(:supplier) }
["kg", "nr", "m2"].each {|new_name| Fabricate(:unit, name: new_name )}
50.times { Fabricate(:product, unit_id: Unit.first.id) }
150.times { Fabricate(:inventory) }


