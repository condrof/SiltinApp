Fabricator(:product) do
  name { Faker::Commerce.product_name }
  created_at { DateTime.now }
  updated_at { DateTime.now }
end

