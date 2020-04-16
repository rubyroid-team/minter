# frozen_string_literal: true

module Minter
  class ApiClient
    def events
      events_at_height(LATEST_BLOCK_HEIGHT)
    end

    def events_at_height(height)
      params = { height: height }
      request = Typhoeus::Request.new(
        TESTNET_BASE_URL + "/events",
        method: :get,
        params: params,
        headers: { "Content-Type" => "application/json" }
      )

      response = request.run
      JSON.parse(response.body)
    end
  end
end
