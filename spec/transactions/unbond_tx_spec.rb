# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::UnbondTx do
  subject do
    Minter::UnbondTx.new(
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
    "0xf87c0102010108aceba00eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a4301888ac7230489e80000808001b845f8431ca0f5b9273c522c6b948523ae922594389619fd5c21846361bec6c72ee2c45b9a21a00dbeed5293f74a0a7924f2a3459f57270358d8621e092f66da38d0dbab9055e1"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
