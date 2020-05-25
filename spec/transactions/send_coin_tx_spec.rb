# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SendCoinTx do
  describe "#sign" do
    let(:private_key) { "de2e01d445cff7bd3ae973baad313a4a18eccdab310649bd10d9e261dafa186d" }
    let(:valid_tx_hash) do
      "0xf88501020a8a4d4e540000000000000001abea8a4d4e540000000000000094e7812ab98ac5ac37e2ab20da313" \
    "6ad91bb22d49789014d1120d7b1600000808001b845f8431ba07fde3c0e8d9ffb5fd7025099c9f3672deffab0b7" \
    "84787f5d45ea8f27b0ffe989a02f7cd63ac0d75e559f540d8b33464b11da4605e623d62a5b2ddce5adf70c35cb"
    end

    it "returns signed transaction" do
      transaction = Minter::SendCoinTx.new(
        address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
        value: 24_000_000_000_000_000_000,
        coin: "MNT",
        nonce: 1,
        chain_id: 2,
        gas_coin: "MNT",
        gas_price: 10
      )
      signed_tx = transaction.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end

  describe "#multisign" do
    let(:multisig_address) { "Mxeda4bb5456f5eb8a19f57c8c6ec844d05feae879" }
    let(:private_key1) { "4de029ca7b95c163f88c66e6351f2a986a48834b4681ec1e43eed5d120227103" }
    let(:private_key2) { "49e48cd0f81e7aabfc840301c66f00318f50b25c79664c3f337d7ad4f919638e" }

    it "returns signed transaction" do
      transaction = Minter::SendCoinTx.new(
        address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
        value: 4_000_000_000_000_000_000,
        coin: "MNT",
        nonce: 2,
        chain_id: 2,
        gas_coin: "MNT",
        gas_price: 10
      )
      signed_tx = transaction.multisign(multisig_address, private_key1, private_key2)
      expect(signed_tx.tx_hash).to eq("0xf8e202020a8a4d4e540000000000000001aae98a4d4e540000000000000094e7812ab98ac5ac37e2ab20da3136ad91bb22d497883782dace9d900000808002b8a3f8a194eda4bb5456f5eb8a19f57c8c6ec844d05feae879f88af8431ba0287dd3956acae624abc25e6ba60018f60a80e144f5678ceb35c35613fcd363bfa01886706c7ffa0e6ccfc7c3dda186d3e8beea5214c30502ad9a24d8a29ced685af8431ba0302a560b420ed0da95f4f8425ac605a2462d35449e44557f152c4308845e1710a04cd1b834752e3a26b0fd543a20e3ef99ca233b049e064146c6a8cdf19d895552")
    end
  end
end
