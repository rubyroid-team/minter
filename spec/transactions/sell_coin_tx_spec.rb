# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SellCoinTx do
  subject do
    described_class.new(
      coin_to_sell: 1,
      value_to_sell: 1_000_000_000_000_000_000,
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
    "0xf865010201010295d401880de0b6b3a764000002880de0b6b3a7640000808001b845f8431ca01552ab0503f8173bef46f2336d48ef6e1fae7bb5aa8b51ec7332b720a8a2f15ca0166970c5d209bac8b5ffae32047f1e4e868c5a20f522aeebb0bc523ae16c64fa"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
