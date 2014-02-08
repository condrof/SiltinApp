# Replace this with ActiveAttr or Virtus style model as they handle
# initialization, equality etc. etc.
class QuoteRequest
  attr_reader :location
  attr_reader :product

  def initialize(args = {})
    @location = args.fetch(:location)
    @product = args.fetch(:product)
  end

  def perform
    "Would have searched for #{request.product} near #{request.location}"
  end

  def search
    # geocode location (maybe allow for lat/long to be passed in too)
    # search based on product name, maybe allow product to be passed in as a model too
    Inventory.where("products.name ILIKE ?", "%#{product}%").joins(:product)
  end

  def ==(other)
    other.location == location &&
    other.product == product
  end
end
