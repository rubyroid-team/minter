# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::DeclareCandidacyTx do
  subject do
    described_class.new(
      address: "Mx9f7fd953c2c69044b901426831ed03ee0bd0597a",
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      commission: 10,
      coin: 1,
      stake: 5_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
  end

  let(:private_key) { "6e1df6ec69638d152f563c5eca6c13cdb5db4055861efc11ec1cdd578afd96bf" }
  let(:valid_tx_hash) do
    "0xf8940102010106b843f841949f7fd953c2c69044b901426831ed03ee0bd0597aa00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a430a01884563918244f40000808001b845f8431ca0d22ec4cdeb146488e39eadcefa982d4bd01a8d44a9af353030db9d1f732a04e5a031a5354af73a47834e3c3b8b9b01b1cd22991b212e598179070a585ea1fe2af2"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
