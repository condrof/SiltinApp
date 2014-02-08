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
    inventories = search
    if inventories.empty?
      "Sorry, nothing found for #{product} near #{location}"
    else
      message = ["Nearest suppliers for #{product}"]
      inventories.map do |inventory|
        message << "#{inventory.supplier.email}: #{"%0.2f" % inventory.price}"
      end
      message.join("\n")
    end
  end

  def search
    # geocode location (maybe allow for lat/long to be passed in too)
    # search based on product name, maybe allow product to be passed in as a model too
    Inventory.where("products.name ILIKE ?", "%#{product}%").
      includes(:product, :supplier).
      limit(5).
      order("price ASC")
  end

  def ==(other)
    other.location == location &&
    other.product == product
  end
end
