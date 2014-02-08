# Replace this with ActiveAttr or Virtus style model as they handle
# initialization, equality etc. etc.
class QuoteRequest
  attr_reader :location
  attr_reader :product

  def initialize(args = {})
    @location = args.fetch(:location)
    @product = args.fetch(:product)
  end

  def ==(other)
    other.location == location &&
    other.product == product
  end
end
