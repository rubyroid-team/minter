# frozen_string_literal: true

module Minter
  class DeclareCandidacyTx
    attr_accessor :address, :pubkey, :commission, :coin, :stake, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(address:, pubkey:, commission:, coin:, stake:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @address = address
      @pubkey = pubkey
      @commission = commission
      @coin = coin
      @stake = stake
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def sign(private_key)
      params = to_params
      params[:PrivateKey] = private_key
      tx_hash = Minter::TransactionFfi.SignDeclareCandidacyTransaction(params.to_json)
      SignedTx.new(tx_hash)
    end

    def to_params
      { Address: address,
        PubKey: pubkey,
        Commission: commission,
        Coin: coin,
        Stake: stake,
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
