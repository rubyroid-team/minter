# frozen_string_literal: true

module Minter
  class ApiClient
    def transaction(tx_hash)
      params = { hash: tx_hash }
      request = Typhoeus::Request.new(
        TESTNET_BASE_URL + "/transaction",
        method: :get,
        params: params,
        headers: { "Content-Type" => "application/json" }
      )

      response = request.run
      JSON.parse(response.body)
    end
  end
end
