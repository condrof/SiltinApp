class SmsRequestsController < ApplicationController
  def create
    xml = Twilio::TwiML.build do |response|
      response.message "Sorry, we didn't understand your request."
    end
    render xml: xml
  end
end
