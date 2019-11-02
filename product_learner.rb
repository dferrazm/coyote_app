require_relative 'product_details_processor'

class ProductLearner
  def self.call(acme_product)
    ProductDetailsProcessor.process(acme_product.fetch_details)
  end
end
