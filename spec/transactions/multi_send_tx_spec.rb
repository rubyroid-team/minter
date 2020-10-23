# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::MultiSendTx do
  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf895010201010db844f842f840df0194fe60014a6e9ac91618f5d1cab3fd58cded61ee9988016345785d8a0000df0194ddab6281766ad86497741ff91b6b48fe85012e3c8802c68af0bb140000808001b845f8431ba0718f10b4468989919adabd215f5a6e83bd70eb1358d725541c2661122f66350ba05ab9e5e28107612f89ce56f4d7846edcbf272e8929eaf0c7c945e2530f40b667"
  end

  describe "#sign" do
    it "returns signed transaction" do
      transaction = Minter::MultiSendTx.new(
        nonce: 1,
        chain_id: 2,
        gas_coin: 1,
        gas_price: 1
      )

      transaction.add_item(
        coin_id: 1,
        address_to: "Mxfe60014a6e9ac91618f5d1cab3fd58cded61ee99",
        value: 100_000_000_000_000_000
      )

      transaction.add_item(
        coin_id: 1,
        address_to: "Mxddab6281766ad86497741ff91b6b48fe85012e3c",
        value: 200_000_000_000_000_000
      )

      signed_tx = transaction.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
