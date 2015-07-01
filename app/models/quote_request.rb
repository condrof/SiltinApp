# Replace this with ActiveAttr or Virtus style model as they handle
# initialization, equality etc. etc.
class QuoteRequest
  attr_reader :location
  attr_reader :product
  attr_accessor :latitude
  attr_accessor :longitude

  def initialize(args = {})
    @location = args.fetch(:location)
    @product = args.fetch(:product)
  end

  def perform
    self.latitude, self.longitude = geocode(location)
    if latitude.nil? || longitude.nil?
      return "Sorry, couldn't find #{location}"
    end

    inventories = search
    if inventories.empty?
      "Sorry, nothing found for #{product} near #{location}"
    else
      message = ["Nearest suppliers for #{product}"]
      inventories.map do |inventory|
        message << "#{inventory.supplier.name}: $#{"%0.2f" % inventory.price} #{inventory.supplier.phone}"
      end
      message.join("\n")
    end
  end

  def search
    distance_sql = Supplier.send(:distance_conditions, within: 20, origin: [latitude, longitude])
    Inventory.where("products.name ILIKE ?", "%#{product}%").
      where(distance_sql).
      includes(:product, :supplier).
      limit(5).
      references(:products).
      order("price ASC")
  end

  def geocode(location)
    LocationGeocoder.find(location)
  end

  def ==(other)
    other.location == location &&
    other.product == product
  end
end
