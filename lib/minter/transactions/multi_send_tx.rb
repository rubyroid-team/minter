# frozen_string_literal: true

module Minter
  class MultiSendTx < Transaction
    SIGN_METHOD = :SignMultiSendTransaction
    attr_accessor :items, :coin, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(nonce:, chain_id:, gas_coin:, gas_price:)
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
      @items = []
    end

    def add_item(symbol:, value:, address_to:)
      @items << { Symbol: symbol, Value: value, AddressTo: address_to }
    end

    def to_params
      {
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price,
        Items: items
      }
    end
  end
end
