class LocationGeocoder
  def self.find(location_name)
    result = geocode("#{location_name}, Sierra Leone")
    [result.lat, result.lng]
  end

  def self.geocode(place)
    Geokit::Geocoders::MultiGeocoder.geocode(place)
  end
end
