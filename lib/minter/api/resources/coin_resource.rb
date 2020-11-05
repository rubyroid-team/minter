# frozen_string_literal: true

module Minter
  module Api
    module CoinResource
      def coin_info(symbol:, height:)
        params = { height: height }
        path = "/coin_info/#{symbol}"
        get(path, params)
      end
    end
  end
end
