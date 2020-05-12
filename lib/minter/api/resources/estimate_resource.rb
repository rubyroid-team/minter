# frozen_string_literal: true

module Minter
  module Api
    module EstimateResource
      def estimate_coin_buy(coinToSell:, valueToBuy:, coinToBuy:, height: 1)
        params = { coinToSell: coinToSell, valueToBuy: valueToBuy, coinToBuy: coinToBuy, height: height }.compact
        path = "/estimate_coin_buy"
        get(path, params)
      end

      def estimate_coin_sell(coinToSell:, valueToSell:, coinToBuy:, height: nil)
        params = { coinToSell: coinToSell, valueToSell: valueToSell, coinToBuy: coinToBuy, height: height }.compact
        path = "/estimate_coin_sell"
        get(path, params)
      end

      def estimate_coin_sell_all(coinToSell:, valueToSell:, coinToBuy:, gasPrice:, height: nil)
        path = "/estimate_coin_sell_all"
        params = { coinToSell: coinToSell, valueToSell: valueToBuy, coinToBuy: coinToBuy, gasPrice: gasPrice, height: height }.compact
        get(path, params)
      end

      def estimate_tx_comission(transaction:)
        path = "/estimate_tx_commission"
        params = { transaction: transaction }
        get(path, params)
      end
    end
  end
end
