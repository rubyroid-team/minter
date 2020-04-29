# frozen_string_literal: true

module Minter
  module Api
    module MinGasPriceResource
      def min_gas_price
        path = "/min_gas_price"
        get(path)
      end
    end
  end
end
