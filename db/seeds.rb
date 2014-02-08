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

@latlong = [ { lat: 7.964722, long: 11.738333  }, 
             { lat: 8.633333, long: 12.05  }, 
             { lat: 8.633333, long: 10.983333  }, 
             { lat: 7.548889, long: 11.1875  }, 
             { lat: 8.683333, long: 12.533333  } ]
2.times { @latlong.each {|l| Fabricate(:supplier, latitude: l[:lat], longitude: l[:long]) } }
["kg", "nr", "m2"].each {|new_name| Fabricate(:unit, name: new_name )}
50.times { Fabricate(:product, unit_id: Unit.first.id) }
150.times { Fabricate(:inventory) }

Admin.create(email: 'admin@siltinapp.com', password: 'password', password_confirmation: 'password')

