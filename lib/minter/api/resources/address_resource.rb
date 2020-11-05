# frozen_string_literal: true

module Minter
  module Api
    module AddressResource
      def address(address:, height: nil)
        params = { height: height }.compact
        path = "/address/#{address}"

        get(path, params)
      end

      alias balance address

    end
  end
end
