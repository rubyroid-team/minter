# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::UnbondTx do
  subject do
    described_class.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      coin: "MNT",
      value: 10_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
  end

  let(:private_key) { "6e1df6ec69638d152f563c5eca6c13cdb5db4055861efc11ec1cdd578afd96bf" }
  let(:valid_tx_hash) do
    "0xf88f0102018a4d4e540000000000000008b6f5a00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c" \
    "6dc1e2c1a438a4d4e5400000000000000888ac7230489e80000808001b844f8421ca0ff5766c85847b37a276f3f9d02" \
    "7fb7c99745920fa395c7bd399cedd8265c5e1d9f791bcdfe4d1bc1e73ada7bf833103c828f22d83189dad2b22ad28a54aacf2a"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
