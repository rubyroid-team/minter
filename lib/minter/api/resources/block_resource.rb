# frozen_string_literal: true

module Minter
  module Api
    module BlockResource
      def block(height:)
        params = { height: height }
        path = "/block"

        get(path, params)
      end
    end
  end
end
