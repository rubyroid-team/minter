# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::DelegateTx do
  subject do
    Minter::DelegateTx.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      coin: 1,
      value: 10_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
  end

  let(:private_key) { "6e1df6ec69638d152f563c5eca6c13cdb5db4055861efc11ec1cdd578afd96bf" }
  let(:valid_tx_hash) do
    "0xf87c0102010107aceba00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a4301888ac7230489e80000808001b845f8431ca06de9cf33b536456b2197b121031c215cb72f9498a187df85a988d737464e5dc3a059789b60988e64f6cfe65d72b942293413387e2956a852d89562546bd425b694"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
