require 'spec_helper'

describe SmsRequestsController, " POST /create" do
  let(:account_sid) { "A234567890123456789012345678901234" }
  let(:message_sid) { "M234567890123456789012345678901234" }
  let(:from) { "+15808233965" }
  let(:to) { "+15558233965" }
  let(:body) { "QUOTE LATRINE FOR BO" }

  def do_action(options = {})
    defaults = {
      MessageSid: message_sid,
      AccountSid: account_sid,
      From: from,
      To: to,
      Body: body
    }
    post :create, defaults.merge(options)
  end

  NO_RESPONSE_TwiML = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Message>Sorry, we didn't understand your request.</Message>
</Response>
  XML

  it "sends don't understand reply when it can't understand the message" do
    do_action(Body: "qwertyouip")
    response.body.should == NO_RESPONSE_TwiML
  end
end
