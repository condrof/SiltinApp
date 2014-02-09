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
  name { Faker::Company.name }
  phone { Faker::PhoneNumber.cell_phone }
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

products = [
  Fabricate(:product, name: "Pit Digging"),
  Fabricate(:product, name: "Pit Liner"),
  Fabricate(:product, name: "Latrine san-plat"),
  Fabricate(:product, name: "Latrine slab"),
  Fabricate(:product, name: "Latrine seat"),
  Fabricate(:product, name: "Latrine walls"),
  Fabricate(:product, name: "Latrine roof"),
]

seed_addresses = [
  "1, Tikonko Road, Bo, Sierra Leone",
  "1, Charlotte Street, Freetown, Sierra Leone",
  "Moyamba, Sierra Leone",
  "Makeni, Sierra Leone",
  "Kabala, Sierra Leone",
]

suppliers = []
2.times { seed_addresses.each { |a| suppliers << Fabricate(:supplier, address: a) } }

["kg", "nr", "m2"].each {|new_name| Fabricate(:unit, name: new_name )}

products.each do |product|
  suppliers.select { |s| rand > 0.5 }
  suppliers.each { |s| Fabricate(:inventory, product: product, supplier: s) }
end

Admin.create(email: 'admin@siltinapp.com', password: 'password', password_confirmation: 'password')

