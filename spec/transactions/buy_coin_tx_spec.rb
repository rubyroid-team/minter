# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::BuyCoinTx do
  subject do
    described_class.new(
      coin_to_buy: "TEST",
      value_to_buy: 1_000_000_000_000_000_000,
      coin_to_sell: "MNT",
      maximum_value_to_sell: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
  end

  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf8830102018a4d4e540000000000000004a9e88a54455354000000000000880de0b6b3a76400008a4d4e540000000" \
    "0000000880de0b6b3a7640000808001b845f8431ca04ee095a20ca58062a5758e2a6d3941857daa8943b5873c57f111" \
    "190ca88dbc56a01148bf2fcc721ca353105e4f4a3419bec471d7ae08173f443a28c3ae6d27018a"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
