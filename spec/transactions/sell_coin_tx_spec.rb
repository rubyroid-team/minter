# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SellCoinTx do
  subject do
    described_class.new(
      coin_to_sell: "MNT",
      value_to_sell: 1_000_000_000_000_000_000,
      coin_to_buy: "TEST",
      minimum_value_to_buy: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
  end

  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf8830102018a4d4e540000000000000002a9e88a4d4e5400000000000000880de0b6b3a76400008a5445535400000" \
    "0000000880de0b6b3a7640000808001b845f8431ba0e34be907a18acb5a1aed263ef419f32f5adc6e772b92f949906b" \
    "497bba557df3a0291d7704980994f7a6f5950ca84720746b5928f21c3cfc5a5fbca2a9f4d35db0"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
