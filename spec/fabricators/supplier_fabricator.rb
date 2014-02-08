Fabricator(:supplier) do
  email { Faker::Internet.safe_email }
  created_at { DateTime.now }
  updated_at { DateTime.now }
  password { "testtest" }
  latitude { rand(180) - 90 }
  longitude { rand(180) - 90 }
end

