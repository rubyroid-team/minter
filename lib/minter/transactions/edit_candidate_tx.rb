# frozen_string_literal: true

module Minter
  class EditCandidateTx
    attr_accessor :pubkey, :reward_address, :owner_address, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(pubkey:, reward_address:, owner_address:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @pubkey = pubkey
      @reward_address = reward_address
      @owner_address = owner_address
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def sign(private_key)
      params = to_params
      params[:PrivateKey] = private_key
      tx_hash = Minter::TransactionFfi.SignEditCandidateTransaction(params.to_json)
      SignedTx.new(tx_hash)
    end

    def to_params
      { PubKey: pubkey,
        RewardAddress: reward_address,
        OwnerAddress: owner_address,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
