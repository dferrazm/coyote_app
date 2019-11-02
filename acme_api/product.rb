class AcmeAPI::Product
  attr_reader :name

  def initialize(name, api_client:)
    @name = name
    @api_client = api_client
  end

  def to_s
    name
  end

  def fetch_details
    @api_client.product_details(name)
  end
end
