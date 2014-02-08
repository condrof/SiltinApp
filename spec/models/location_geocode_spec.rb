require 'spec_helper'

describe LocationGeocoder, ".find(location_name)" do
  let(:location_name) { "Bo" }
  subject { LocationGeocoder }

  it "geocodes the location in Sierra Leone" do
    result_double = double(lat: 10.0, lng: -90.0)
    allow(subject).to receive(:geocode).with("#{location_name}, Sierra Leone").and_return(result_double)
    expect(subject.find(location_name)).to eql([10.0, -90.0])
  end
end
