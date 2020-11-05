# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::CreateCoinTx do
  subject do
    Minter::CreateCoinTx.new(
      name: "SUPER TEST",
      symbol: "SPRTEST",
      initial_amount: 100_000_000_000_000_000_000,
      initial_reserve: 20_000_000_000_000_000_000_000,
      reserve_ratio: 10,
      max_supply: 1_000_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
  end

  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf8870102010105b7f68a535550455220544553548a5350525445535400000089056bc75e2d631000008a043c33c19375648000000a893635c9adc5dea00000808001b845f8431ba034615f080a026ee579395aeb4c2eac974a14c091f1bb112629b2b5be0a82628da07f3347c71fa0668d01126dfae49d2b402067275878e4ffd26fd42a73cdf01950"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
