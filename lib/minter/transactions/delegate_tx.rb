# frozen_string_literal: true

module Minter
  class DelegateTx < Transaction
    attr_accessor :pubkey, :coin, :value, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(pubkey:, coin:, value:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @pubkey = pubkey
      @coin = coin
      @value = value
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def to_params
      { PubKey: pubkey,
        Coin: coin,
        Value: value,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
