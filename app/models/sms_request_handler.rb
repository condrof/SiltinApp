class SmsRequestHandler
  def self.perform(request)
    # Yeah, yeah, yeah, OCP violation but sure someone will get practise at
    # replace conditional with polymorphism a bit later
    case request
    when QuoteRequest
      "Would have searched for #{request.product} near #{request.location}"
    end
  end
end
