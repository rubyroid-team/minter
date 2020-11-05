# frozen_string_literal: true

module Minter
  module Api
    module NonceResource
      def nonce(address:)
        path = "/address/#{address}"
        response = get(path)
        response.body["transaction_count"].to_i + 1
      end
    end
  end
end
