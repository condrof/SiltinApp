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

  def response_twiml(message)
<<-XML
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Message>#{message}</Message>
</Response>
XML
  end

  it "sends don't understand reply when it can't understand the message" do
    message = "Sorry, we didn't understand your request."
    do_action(Body: "qwertyouip")
    expect(response.body).to eql(response_twiml(message))
  end

  it "sends the response message when it can understand the message" do
    message = "Your Results"
    sms_request =  "Quote: Bo Seat"
    request_double = double(perform: message)
    SmsRequestParser.should_receive(:parse).with(sms_request).and_return(request_double)
    do_action(Body: "Quote: Bo Seat")
    expect(response.body).to eql(response_twiml(message))
  end
end
