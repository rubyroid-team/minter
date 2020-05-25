# frozen_string_literal: true

module Minter
  class CreateMultisigAddressTx < Transaction
    attr_accessor :addresses, :threshold, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(threshold:, nonce:, chain_id:, gas_coin:, gas_price:)
      @threshold = threshold
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
      @addresses = []
    end

    def add_address(address:, weight:)
      @addresses << { Address: address, Weight: weight }
    end

    def to_params
      {
        Threshold: threshold,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price,
        Addresses: addresses
      }
    end

    def multisig_address
      result = JSON.parse(Minter::TxHashFfi.GetMultisigAddress(to_params.to_json))
      raise TransactionError, result["error"] unless result["success"] == "true"

      result["multisig_address"]
    end
  end
end
