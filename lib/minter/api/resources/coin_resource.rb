module Minter
  module Api
    module CoinResource
      def coin_info(symbol:, height:)
        params = {symbol: symbol, height: height}
        path =  '/coin_info'
        get(path, params)
      end
    end
  end
end
