class SmsRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    sms_request = SmsRequestParser.parse(params[:Body])
    if sms_request
      raise "Shouldn't understand stuff yet"
    else
      xml = Twilio::TwiML.build do |response|
        response.message "Sorry, we didn't understand your request."
      end
    end
    render xml: xml
  end
end
