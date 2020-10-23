# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SetCandidateOnTx do
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
    "0xf872010201010aa2e1a00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43808001b845f8431ba0efff777e61a78141ceeab311776dfd0bfc6745f125c688db86ccfa350d3d3b84a074419c32dd0d1d2ebdc1c5bfdffb238d2ef88a618e28a2ce2410880264d3b3cc"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
