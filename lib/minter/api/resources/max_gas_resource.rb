# frozen_string_literal: true

module Minter
  module Api
    module MaxGasResource
      def max_gas
        path = "/max_gas_price"
        get(path)
      end
    end
  end
end
