Fabricator(:inventory) do
  product
  supplier
  price { rand(1..150)* rand() }
  created_at { DateTime.now }
  updated_at { DateTime.now }
end

