# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SetCandidateOnTx do
  subject do
    described_class.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
  end

  let(:private_key) { "05ddcd4e6f7d248ed1388f0091fe345bf9bf4fc2390384e26005e7675c98b3c1" }
  let(:valid_tx_hash) do
    "0xf87c0102018a4d4e54000000000000000aa2e1a00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c" \
    "6dc1e2c1a43808001b845f8431ba0095aed433171fe5ac385ccd299507bdcad3dd2269794fd0d14d4f58327ddc87ea0" \
    "46ec7e4f8f9b477a1255485f36e0567e62283723ecc5a0bd1e5d201e53e85245"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
