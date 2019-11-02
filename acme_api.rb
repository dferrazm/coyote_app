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

      JSON.parse(response.body)
    end

    def product_details(name)
      response = RestClient.get("#{BASE_URL}/product_details/#{name}")

      ProductDetails.new(JSON.parse(response.body))
    end
  end

  class ProductDetails
    attr_reader :user_manual

    def initialize(details)
      @user_manual = details.fetch('user_manual', '')
    end

    def user_manual?
      !user_manual.empty?
    end
  end
end
