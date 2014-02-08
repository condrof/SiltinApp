require 'spec_helper'

describe SmsRequestParser, ".parse(request_body)" do
  it "returns false if it can't parse the request" do
    expect(SmsRequestParser.parse("qwertyouip")).to be(false)
  end
end
