# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::CreateCoinTx do
  subject do
    described_class.new(
      name: "SUPER TEST",
      symbol: "SPRTEST",
      initial_amount: 100_000_000_000_000_000_000,
      initial_reserve: 10_000_000_000_000_000_000,
      reserve_ratio: 10,
      max_supply: 1_000_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
  end

  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf8910102018a4d4e540000000000000005b7f68a535550455220544553548a5350525445535400000089056bc75e2" \
    "d631000008a021e19e0c9bab24000000a893635c9adc5dea00000808001b845f8431ba07bf9c6916aabaac7fb34811b" \
    "42350c0dbcfc6228cf2ce9b927254d01f9e0ec66a0039ea86546a950cd717544d9b19c30a5248cfeb0f93060145144b5bb511a4218"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
