module Minter
  module Api
    module EstimateResource
      def coin_buy(coinToSell:, valueToBuy:, coinToBuy:, height: nil)
        params = {coinToSell: coinToSell , valueToBuy: valueToBuy , coinToBuy: coinToBuy , height: height}.compact
        path =  '/estimate_coin_buy'
        get(path, params)
      end

      def coin_sell(coinToSell:, valueToSell:, coinToBuy:, height: nil)
        params = {coinToSell: coinToSell , valueToSell: valueToBuy , coinToBuy: coinToBuy , height: height}.compact
        path =  '/estimate_coin_'
        get(path, params)
      end

      def coin_sell_all(coinToSell:, valueToSell:, coinToBuy:, gasPrice:, height: nil)
        path =  '/estimate_coin_sell_all'
        params = {coinToSell: coinToSell , valueToSell: valueToBuy , coinToBuy: coinToBuy , gasPrice: gasPrice, height: height}.compact
        get(path, params)
      end

      def tx_comission(transaction:)
        path =  '/estimate_tx_commission'
        params = { transaction: transaction }
        get(path, params)
      end
    end
  end
end
