require 'spec_helper'

describe QuoteRequest, ".search" do
  let(:location_name) { "Bo" }
  let(:product_name) { "findme" }

  it "geocodes the location"

  it "returns inventories for products that match the product name" do
    dont_find_product = Fabricate(:product, name: "notme thing")
    find_product = Fabricate(:product, name: "findme thing")
    supplier = Fabricate(:supplier)
    dont_find_inventory = Fabricate(:inventory, supplier: supplier, product: dont_find_product)
    find_inventory = Fabricate(:inventory, supplier: supplier, product: find_product)

    QuoteRequest.new(location: location_name, product: product_name).search.should == [find_inventory]
  end
end
