# frozen_string_literal: true

module Minter
  class ApiClient
    def min_gas_price
      request = Typhoeus::Request.new(
        TESTNET_BASE_URL + "/min_gas_price",
        method: :get,
        headers: { "Content-Type" => "application/json" }
      )

      response = request.run
      JSON.parse(response.body)
    end
  end
end
