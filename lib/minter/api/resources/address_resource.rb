# frozen_string_literal: true

module Minter
  module Api
    module AddressResource
      def address(address:, height: nil)
        params = { address: address, height: height }.compact
        path = "/address"

        get(path, params)
      end

      def addresses(_params)
        path = "/address"
        get(path)
      end
    end
  end
end
