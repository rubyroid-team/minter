# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::MultiSendTx do
  let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
  let(:valid_tx_hash) do
    "0xf8b30102018a4d4e54000000000000000db858f856f854e98a4d4e540000000000000094fe60014a6e9ac91618f5d1cab3fd58cded61ee9988016345785d8a0000e98a4d4e540000000000000094ddab6281766ad86497741ff91b6b48fe85012e3c8802c68af0bb140000808001b845f8431ca0b15dcf2e013df1a2aea02e36a17af266d8ee129cdcb3e881d15b70c9457e7571a0226af7bdaca9d42d6774c100b22e0c7ba4ec8dd664d17986318e905613013283"
  end

  describe "#sign" do
    it "returns signed transaction" do
      transaction = Minter::MultiSendTx.new(
        nonce: 1,
        chain_id: 2,
        gas_coin: "MNT",
        gas_price: 1
      )

      transaction.add_item(
        symbol: "MNT",
        address_to: "Mxfe60014a6e9ac91618f5d1cab3fd58cded61ee99",
        value: 100_000_000_000_000_000
      )

      transaction.add_item(
        symbol: "MNT",
        address_to: "Mxddab6281766ad86497741ff91b6b48fe85012e3c",
        value: 200_000_000_000_000_000
      )

      signed_tx = transaction.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
