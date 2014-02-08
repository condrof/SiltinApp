class SmsRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    xml = Twilio::TwiML.build do |response|
      response.message "Sorry, we didn't understand your request."
    end
    render xml: xml
  end
end
