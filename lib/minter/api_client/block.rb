# frozen_string_literal: true

module Minter
  class ApiClient
    def block(height = 1)
      params = {}
      params[:height] = height if height > 0

      request = Typhoeus::Request.new(
        TESTNET_BASE_URL + "/block",
        method: :get,
        params: params,
        headers: { "Content-Type" => "application/json" }
      )

      response = request.run
      JSON.parse(response.body)
    end
  end
end
