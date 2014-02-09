if ENV.include?('GEOKIT_PROXY')
  Geokit::Geocoders::proxy = ENV['GEOKIT_PROXY']
end
Geokit::Geocoders.secure = false
