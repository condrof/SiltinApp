class SmsRequestParser
  QUOTE_REQUEST_RE = /quote:\s*(.+?)\s+(.+)/i

  def self.parse(request_body)
    # This is going to get very ugly very quickly...
    if request_body.match(QUOTE_REQUEST_RE)
      QuoteRequest.new(location: $1, product: $2)
    else
      false
    end
  end
end
