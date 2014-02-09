Fabricator(:supplier) do
  name { Faker::Company.name }
  phone { Faker::PhoneNumber.cell_phone }
  email { Faker::Internet.safe_email }
  created_at { DateTime.now }
  updated_at { DateTime.now }
  password { "testtest" }
  address { [
      "1, Tikonko Road, Bo, Sierra Leone",
      "1, Charlotte Street, Freetown, Sierra Leone",
      "Moyamba, Sierra Leone",
      "Makeni, Sierra Leone",
      "Kabala, Sierra Leone",
    ].sample
  }
end

