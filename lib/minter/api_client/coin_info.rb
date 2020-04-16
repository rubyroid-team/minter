# frozen_string_literal: true

module Minter
  class ApiClient
    def coin_info(symbol, height = 0)
      params = { symbol: symbol }
      params[:height] = height if height > 0

      request = Typhoeus::Request.new(
        TESTNET_BASE_URL + "/coin_info",
        method: :get,
        params: params,
        headers: { "Content-Type" => "application/json" }
      )

      response = request.run
      JSON.parse(response.body)
    end
  end
end
