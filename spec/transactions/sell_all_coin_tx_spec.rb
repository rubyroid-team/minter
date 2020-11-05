# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SellAllCoinTx do
  subject do
    Minter::SellAllCoinTx.new(
      coin_to_sell: 1,
      coin_to_buy: 2,
      minimum_value_to_buy: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
  end

  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf85c01020101038ccb0102880de0b6b3a7640000808001b845f8431ba0db51e3ca2b75a4a617362946f5f5ee26c75900dae8f8be2400509338bafcd8d4a02e031ead1656d1321520564a34321acc8c6dda63cd4c8bd4530ec641aa4b1c7b"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
