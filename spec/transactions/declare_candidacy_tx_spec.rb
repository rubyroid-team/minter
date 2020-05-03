# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::DeclareCandidacyTx do
  subject do
    described_class.new(
      address: "Mx9f7fd953c2c69044b901426831ed03ee0bd0597a",
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      commission: 10,
      coin: "MNT",
      stake: 5_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
  end

  let(:private_key) { "6e1df6ec69638d152f563c5eca6c13cdb5db4055861efc11ec1cdd578afd96bf" }
  let(:valid_tx_hash) do
    "0xf8a80102018a4d4e540000000000000006b84df84b949f7fd953c2c69044b901426831ed03ee0bd0597aa00eb98ea" \
    "04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a430a8a4d4e5400000000000000884563918244f4" \
    "0000808001b845f8431ca0c379230cbe09103b31983402c9138ad29d839bcecee70e11ac9bf5cfe70850d9a06c92bfb" \
    "9a627bfaefc3ad46fc60ff1fdc42efe0e8805d57f20795a403c91e8bd"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
