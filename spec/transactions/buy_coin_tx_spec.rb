# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::BuyCoinTx do
  subject do
    described_class.new(
      coin_to_buy: 2,
      value_to_buy: 1_000_000_000_000_000_000,
      coin_to_sell: 1,
      maximum_value_to_sell: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
  end

  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf865010201010495d402880de0b6b3a764000001880de0b6b3a7640000808001b845f8431ca0ad334ececd68741f1f9b96e15a2b5d6a7fe6c378cdaab6c6e8947541e1af74dda038c829477eb261948598fd3dd039aba41aa5691f50d3ee2bb4125bc38b294725"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
