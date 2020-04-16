# frozen_string_literal: true

module Minter
  class ApiClient
    def balance(address)
      balance_at_height(address, LATEST_BLOCK_HEIGHT)
    end

    def balance_at_height(address, height)
      params = { address: address }
      params[:height] = height if height > 0

      request = Typhoeus::Request.new(
        TESTNET_BASE_URL + "/address",
        method: :get,
        params: params,
        headers: { "Content-Type" => "application/json" }
      )

      response = request.run
      JSON.parse(response.body)["result"]["balance"]
    end
  end
end
