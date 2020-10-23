# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SetCandidateOffTx do
  subject do
    described_class.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
  end

  let(:private_key) { "05ddcd4e6f7d248ed1388f0091fe345bf9bf4fc2390384e26005e7675c98b3c1" }
  let(:valid_tx_hash) do
    "0xf872010201010ba2e1a00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43808001b845f8431ca07c573ba835b7501fae8af3c5d2a414933c9070a217681dc359f8f44a55eeecfaa010d3fd6aa1078d5a2fca66b5f4b456deacfc49eb4be055ba531a4247cb516839"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
