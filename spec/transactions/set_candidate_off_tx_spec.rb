# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SetCandidateOffTx do
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
    "0xf87c0102018a4d4e54000000000000000ba2e1a00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c" \
    "6dc1e2c1a43808001b845f8431ca02ac45817f167c34b55b8afa0b6d9692be28e2aa41dd28a134663d1f5bebb5ad8a0" \
    "6d5f161a625701d506db20c497d24e9939c2e342a6ff7d724cb1962267bd4ba5"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
