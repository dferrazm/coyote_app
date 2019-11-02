require_relative 'product_manual_reader'

class ProductDetailsProcessor
  def self.process(product_details)
    ProductManualReader.read(product_details.user_manual)
  end
end
