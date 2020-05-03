# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SellAllCoinTx do
  subject do
    described_class.new(
      coin_to_sell: "MNT",
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
    "0xf87a0102018a4d4e540000000000000003a0df8a4d4e54000000000000008a54455354000000000000880de0b6b3a" \
    "7640000808001b845f8431ca0b10794a196b6ad2f94e6162613ca9538429dd49ca493594ba9d99f80d2499765a03c1d" \
    "78e9e04f57336691e8812a16faccb00bf92ac817ab61cd9bf001e9380d47"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
