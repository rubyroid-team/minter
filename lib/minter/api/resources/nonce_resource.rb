# frozen_string_literal: true

module Minter
  module Api
    module NonceResource
      def nonce(address:)
        params = { address: address }.compact
        path = "/address"
        response = get(path, params)
        response.body["result"]["transaction_count"].to_i + 1
      end
    end
  end
end
