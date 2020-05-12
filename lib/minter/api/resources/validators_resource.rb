# frozen_string_literal: true

module Minter
  module Api
    module ValidatorsResource
      def validators(height: 1)
        params = { height: height }
        path = "/validators"
        get(path, params)
      end
    end
  end
end
