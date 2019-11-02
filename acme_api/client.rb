require 'rest-client'
require 'json'

module AcmeAPI
  ##
  # Client class responsible to abstract the usage of the Acme Corp. API.
  #
  # For further documentation please check https://url.to.fake-acme-api.com
  class Client
    BASE_URL = 'http://localhost:9292'.freeze

    def products
      response = RestClient.get("#{BASE_URL}/products")
      response_parsed = JSON.parse(response.body)

      response_parsed.map do |product_name|
        Product.new(product_name, api_client: self)
      end
    end

    def product_details(name)
      response = RestClient.get("#{BASE_URL}/product_details/#{name}")
      response_parsed = JSON.parse(response.body)

      ProductDetails.new(response_parsed)
    end
  end
end
