# frozen_string_literal: true

module Minter
  class SellCoinTx < Transaction
    attr_accessor :coin_to_sell, :value_to_sell, :coin_to_buy, :minimum_value_to_buy, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(coin_to_sell:, value_to_sell:, coin_to_buy:, minimum_value_to_buy:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @coin_to_sell = coin_to_sell
      @value_to_sell = value_to_sell
      @coin_to_buy = coin_to_buy
      @minimum_value_to_buy = minimum_value_to_buy
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def to_params
      { CoinToSell: coin_to_sell,
        ValueToSell: value_to_sell,
        CoinToBuy: coin_to_buy,
        MinimumValueToBuy: minimum_value_to_buy,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
