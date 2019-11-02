require_relative 'user_manual_parser'

class ProductManualReader
  def self.read(product_manual)
    parsed_product_manual = UserManualParser.parse!(product_manual)

    puts "According with the manual, one should: #{parsed_product_manual}"
  end
end
