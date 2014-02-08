require 'spec_helper'

describe QuoteRequest, ".perform" do
  subject { QuoteRequest.new(location: location_name, product: product_name) }
  let(:location_name) { "Bo" }
  let(:product_name) { "seat" }

  it "returns not found message if can't find products" do
    subject.stub(:search).and_return([])
    expect(subject.perform).to eql("Sorry, nothing found for #{product_name} near #{location_name}")
  end

  it "returns the inventories when they are found" do
    inventory1 = Fabricate.build(:inventory, price: 1.00)
    inventory2 = Fabricate.build(:inventory, price: 2.00)
    subject.stub(:search).and_return([inventory1, inventory2])
    expect(subject.perform).to include("#{inventory1.supplier.email}: 1.00")
    expect(subject.perform).to include("#{inventory2.supplier.email}: 2.00")
  end
end

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
