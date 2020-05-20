# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::CreateMultisiqAddressTx do
  let(:address1) { "Mx08d920c5d93dbf23038fe1a54bbb34f41f77677c" }
  let(:address2) { "Mx772fd5bd06356250e5efe572b6ae615860ee0c17" }
  let(:address3) { "Mx9c7f68ff71b5819c41e8f87cc99bdf6359da3d75" }
  let(:private_key) { "ae089b32e4e0976ca6888cb1023148bd1a9f1cc28c5d442e52e586754ff48d63" }

  let(:valid_tx_hash) do
    "0xf8a30b02018a4d4e54000000000000000cb848f84680c3010305f83f9408d920c5d93dbf23038fe1a54bbb34f41f77677c94772fd5bd06356250e5efe572b6ae615860ee0c17949c7f68ff71b5819c41e8f87cc99bdf6359da3d75808001b845f8431ba0835e9c3dbc8abf49ff78c28648bfcbd738e97c7dab22c85eac1d71a7b29d3dc6a047d59d0d25f9f104232ce582be04c0eb4183e82b32ea2038314b886c7ea7492e"
  end

  describe "#sign" do
    it "returns signed transaction" do
      transaction = Minter::CreateMultisiqAddressTx.new(
        threshold: 7,
        nonce: 11,
        chain_id: 2,
        gas_coin: "MNT",
        gas_price: 1
      )

      transaction.add_address(address: address1, weight: 1)
      transaction.add_address(address: address2, weight: 3)
      transaction.add_address(address: address3, weight: 5)

      signed_tx, multisiq_address = transaction.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
      expect(multisiq_address).to  eq("Mx5623dfdfaaf67a0d0ad13fbc43721237b955e1ca")
    end
  end
end
