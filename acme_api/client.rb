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
      json_response = get!(path: '/products')

      json_response.map do |product_name|
        Product.new(product_name, api_client: self)
      end
    end

    def product_details(name)
      json_response = get!(
        path: "/product_details/#{name}",
        expects: %w[user_manual]
      )

      ProductDetails.new(json_response)
    end

    private

    def get!(path:, expects: [])
      http_response = RestClient.get(BASE_URL + path)
      json_response = JSON.parse(http_response.body)

      check_expectations!(http_response, json_response, expects)

      json_response
    end

    def check_expectations!(http_response, json_response, expectations)
      expectations.each do |expected_attr|
        value = json_response[expected_attr.to_s]
        failure = value.nil? || attribute.empty?

        raise ExpectationError.new(http_response, expected_attr) if failure
      end
    end
  end
end
