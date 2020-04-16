# frozen_string_literal: true

module Minter
  class ApiClient
    def max_gas
      request = Typhoeus::Request.new(
        TESTNET_BASE_URL + "/max_gas",
        method: :get,
        headers: { "Content-Type" => "application/json" }
      )

      response = request.run
      JSON.parse(response.body)
    end
  end
end
