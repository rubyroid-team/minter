# frozen_string_literal: true

module Minter
  class SendCoinTx
    attr_accessor :type, :address_to, :value, :coin, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(address_to:, value:, coin:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @address_to = address_to
      @value = value
      @coin =  coin
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def sign(private_key)
      params = to_params
      params[:PrivateKey] = private_key
      tx_hash = Minter::TransactionFfi.SignTransaction(params.to_json)
      SignedTx.new(tx_hash)
    end

    def to_params
      { AddressTo: address_to,
        Value: value,
        Coin: coin,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
