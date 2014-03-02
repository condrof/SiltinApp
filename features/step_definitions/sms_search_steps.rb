# Geolocation is faked, see env.rb
Given(/^Suppliers for the (.*) product near (.*)$/) do |product_name, location_name|
  product = Fabricate(:product, name: product_name)
  supplier1 = Fabricate(:supplier, name: "Supplier 1", address: "1, Tikonko Road, Bo, Sierra Leone")
  supplier2 = Fabricate(:supplier, name: "Supplier 2", address: "1, Tikonko Road, Bo, Sierra Leone")
  Fabricate(:inventory, product: product, supplier: supplier1, price: 1.00)
  Fabricate(:inventory, product: product, supplier: supplier2, price: 2.00)
end

When(/^I SMS a quote for a (.*) near (.*)$/) do |product_name, location_name|
  @sms = post "/sms_requests", Body: "Quote: #{location_name} #{product_name}"
end

Then(/^I should get a list of suppliers near (.*) with thier price for a (.*)$/) do |location_name, product_name|
  expect(@sms.body).to match(/Supplier 1: \$1.00/)
  expect(@sms.body).to match(/Supplier 2: \$2.00/)
end
