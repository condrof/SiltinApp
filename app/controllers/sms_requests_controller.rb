class SmsRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    sms_request = SmsRequestParser.parse(params[:Body])
    xml = if sms_request
      message = SmsRequestHandler.perform(sms_request)
      sms_response message
    else
      sms_response "Sorry, we didn't understand your request."
    end
    render xml: xml
  end

  private
  def sms_response(message)
    Twilio::TwiML.build do |response|
      response.message message
    end
  end
end
