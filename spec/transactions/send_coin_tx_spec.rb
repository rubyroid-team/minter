# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SendCoinTx do
  subject do
    described_class.new(
      address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
      value: 24_000_000_000_000_000_000,
      coin: "MNT",
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 10
    )
  end

  let(:private_key) { "de2e01d445cff7bd3ae973baad313a4a18eccdab310649bd10d9e261dafa186d" }
  let(:valid_tx_hash) do
    "0xf88501020a8a4d4e540000000000000001abea8a4d4e540000000000000094e7812ab98ac5ac37e2ab20da313" \
    "6ad91bb22d49789014d1120d7b1600000808001b845f8431ba07fde3c0e8d9ffb5fd7025099c9f3672deffab0b7" \
    "84787f5d45ea8f27b0ffe989a02f7cd63ac0d75e559f540d8b33464b11da4605e623d62a5b2ddce5adf70c35cb"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
