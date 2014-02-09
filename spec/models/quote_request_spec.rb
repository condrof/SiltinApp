require 'spec_helper'

describe QuoteRequest, ".perform" do
  subject { QuoteRequest.new(location: location_name, product: product_name) }
  let(:location_name) { "Bo" }
  let(:product_name) { "seat" }

  before do
    subject.stub(:geocode).and_return([0, 0])
  end

  it "returns location not found message if it can't find the location" do
    subject.stub(:geocode).and_return([nil, nil])
    expect(subject.perform).to eql("Sorry, couldn't find #{location_name}")
  end

  it "returns not found message if can't find products" do
    subject.stub(:search).and_return([])
    expect(subject.perform).to eql("Sorry, nothing found for #{product_name} near #{location_name}")
  end

  it "returns the inventories when they are found" do
    inventory1 = Fabricate.build(:inventory, price: 1.00)
    inventory2 = Fabricate.build(:inventory, price: 2.00)
    subject.stub(:search).and_return([inventory1, inventory2])
    expect(subject.perform).to include("#{inventory1.supplier.name}: $1.00 #{inventory1.supplier.phone}")
    expect(subject.perform).to include("#{inventory2.supplier.name}: $2.00 #{inventory2.supplier.phone}")
  end
end

describe QuoteRequest, ".search" do
  let(:location_name) { "Bo" }
  let(:product_name) { "findme" }

  it "returns inventories for products that match the product name" do
    dont_find_product = Fabricate(:product, name: "notme thing")
    find_product = Fabricate(:product, name: "findme thing")
    find_supplier = Fabricate(:supplier)
    find_supplier.update_attributes! latitude: 0, longitude: 0
    dont_find_supplier = Fabricate(:supplier)
    dont_find_supplier.update_attributes! latitude: 40, longitude: 40
    dont_find_inventory1 = Fabricate(:inventory, supplier: find_supplier, product: dont_find_product)
    dont_find_inventory2 = Fabricate(:inventory, supplier: dont_find_supplier, product: find_product)
    find_inventory = Fabricate(:inventory, supplier: find_supplier, product: find_product)

    qr = QuoteRequest.new(location: location_name, product: product_name)
    qr.stub(:geocode).and_return([0, 0])
    qr.search.should == [find_inventory]
  end
end
