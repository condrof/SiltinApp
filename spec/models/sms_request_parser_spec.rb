require 'spec_helper'

describe SmsRequestParser, ".parse(request_body)" do
  it "returns false if it can't parse the request" do
    expect(SmsRequestParser.parse("qwertyouip")).to be(false)
  end

  describe "Quote request" do
    let(:request_body) { "Quote: #{location} #{product}" }
    let(:location) { "Bo" }
    let(:product)  { "Seat" }

    it "returns the parsed quote request" do
      expected_result = QuoteRequest.new(location: location, product: product)
      SmsRequestParser.parse(request_body).should == expected_result
    end
  end
end
