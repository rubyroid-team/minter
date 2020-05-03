# frozen_string_literal: true

module Minter
  class CreateCoinTx
    attr_accessor :name, :symbol, :initial_amount, :max_supply, :initial_reserve, :reserve_ratio, :nonce, :chain_id, :gas_coin, :gas_price

    def initialize(name:, symbol:, initial_amount:, max_supply:, initial_reserve:, reserve_ratio:, nonce:, chain_id:, gas_coin:, gas_price:) # rubocop:disable Metrics/ParameterLists
      @name = name
      @symbol = symbol
      @max_supply = max_supply
      @initial_amount = initial_amount
      @initial_reserve = initial_reserve
      @reserve_ratio = reserve_ratio
      @nonce = nonce
      @chain_id = chain_id
      @gas_coin = gas_coin
      @gas_price = gas_price
    end

    def sign(private_key)
      params = to_params
      params[:PrivateKey] = private_key
      tx_hash = Minter::TransactionFfi.SignCreateCoinTransaction(params.to_json)
      SignedTx.new(tx_hash)
    end

    def to_params
      { Name: name,
        Symbol: symbol,
        InitialAmount: initial_amount,
        MaxSupply: max_supply,
        InitialReserve: initial_reserve,
        ReserveRation: reserve_ratio, # TODO: rename ReserveRation to ReserveRatio
        Nonce: nonce,
        ChainId: chain_id,
        GasCoin: gas_coin,
        GasPrice: gas_price }
    end
  end
end
