require 'json'

class AcmeAPI::ExpectationError < StandardError
  def initialize(response, expected_attribute)
    super 'Failed HTTP request expectation!'

    @response = response
    @expected_attribute = expected_attribute
  end

  def to_s
    "#{super}\n#{JSON.pretty_generate log_response}"
  end

  private

  attr_reader :response, :expected_attribute

  def log_response
    {
      http_method: response.request.method,
      uri: response.request.uri.to_s,
      response_body: response.body,
      expected_attribute: expected_attribute
    }
  end
end
