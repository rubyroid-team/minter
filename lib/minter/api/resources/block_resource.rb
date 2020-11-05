# frozen_string_literal: true

module Minter
  module Api
    module BlockResource
      def block(height:)
        path = "/block/#{height}"

        get(path)
      end
    end
  end
end
