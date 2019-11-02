require_relative 'acme_api'
require_relative 'trap'

class Coyote
  def initialize(acme_api: AcmeAPI::Client.new)
    @acme_api = acme_api
  end

  def set_trap!
    request_product_from_acme
    learn_how_to_use_it

    Trap.new(acme_product)
  end

  private

  attr_reader :acme_api, :acme_product

  def request_product_from_acme
    @acme_product = acme_api.products.sample
  end

  def learn_how_to_use_it
    details = acme_api.product_details(acme_product)

    if details.user_manual?
      puts "According with the manual: #{details.user_manual}"
    else
      puts "There's nothing to learn about #{acme_product}"
    end
  end
end
