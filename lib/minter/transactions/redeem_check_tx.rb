# frozen_string_literal: true

module Minter
  class RedeemCheckTx < Transaction
    attr_accessor :check, :proof, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(check:, proof:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @check = check
      @proof = proof
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def to_params
      { Check: check,
        Proof: proof,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
