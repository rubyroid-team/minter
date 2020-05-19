# frozen_string_literal: true

module Minter
  class SetCandidateOffTx < Transaction
    SIGN_METHOD = :SignSetCandidateOffTransaction
    attr_accessor :pubkey, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(pubkey:, nonce:, chain_id:, gas_coin:, gas_price:)
      @pubkey = pubkey
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def to_params
      { PubKey: pubkey,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
