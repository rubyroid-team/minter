# frozen_string_literal: true

module Minter
  class BuyCoinTx < Transaction
    attr_accessor :coin_to_buy, :value_to_buy, :coin_to_sell, :maximum_value_to_sell, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(coin_to_buy:, value_to_buy:, coin_to_sell:, maximum_value_to_sell:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @coin_to_buy = coin_to_buy
      @value_to_buy = value_to_buy
      @coin_to_sell = coin_to_sell
      @maximum_value_to_sell = maximum_value_to_sell
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def to_params
      { CoinToBuy: coin_to_buy,
        ValueToBuy: value_to_buy,
        CoinToSell: coin_to_sell,
        MaximumValueToSell: maximum_value_to_sell,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
