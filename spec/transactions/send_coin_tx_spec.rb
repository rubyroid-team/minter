# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::SendCoinTx do
  describe "#sign" do
    let(:private_key) { "07bc17abdcee8b971bb8723e36fe9d2523306d5ab2d683631693238e0f9df142" }
    let(:valid_tx_hash) do
      "0xf8700102010101a0df01941b685a7c1e78726c48f619c497a07ed75fe00483880de0b6b3a7640000808001b845f8431ba0fffc3f503ace8a5d0c87efe50cf33ad41e3475459120d9c6fd75bd796b192313a0243d643a799e844ad82382d41cee98137a1d0c5888ff13951919e5e241ab89e0"
    end

    it "returns signed transaction" do
      transaction = Minter::SendCoinTx.new(
        address_to: "Mx1b685a7c1e78726c48f619c497a07ed75fe00483",
        value: 1_000_000_000_000_000_000,
        coin: 1,
        nonce: 1,
        chain_id: 2,
        gas_coin: 1,
        gas_price: 1
      )
      signed_tx = transaction.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end

  describe "#multisign" do
    let(:multisig_address) { "Mx9c7f68ff71b5819c41e8f87cc99bdf6359da3d75" }
    let(:private_key1) { "4de029ca7b95c163f88c66e6351f2a986a48834b4681ec1e43eed5d120227103" }
    let(:private_key2) { "49e48cd0f81e7aabfc840301c66f00318f50b25c79664c3f337d7ad4f919638e" }

    it "returns signed transaction" do
      transaction = Minter::SendCoinTx.new(
        address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
        value: 4_000_000_000_000_000_000,
        coin: 1,
        nonce: 11,
        chain_id: 2,
        gas_coin: 1,
        gas_price: 1
      )
      signed_tx = transaction.multisign(multisig_address, "ae089b32e4e0976ca6888cb1023148bd1a9f1cc28c5d442e52e586754ff48d63", "49e48cd0f81e7aabfc840301c66f00318f50b25c79664c3f337d7ad4f919638e")
      expect(signed_tx.tx_hash).to eq("0xf8ce0b02010101a0df0194e7812ab98ac5ac37e2ab20da3136ad91bb22d497883782dace9d900000808002b8a3f8a1949c7f68ff71b5819c41e8f87cc99bdf6359da3d75f88af8431ca02f1351298e3ee280aab0d8f2a1454c7adabc77674e79f7b4a6bba017d17aaca9a02215e6eff46e505a095ddaf457596bac8f16751c943d8f5b5ac138a12da89489f8431ba0e5151abc1d42faea36f87900d58e120fb885082e91aaa59439e3a7089eb3e298a057db7bdded2c3ae76f03a9c877b1caa0591d2847774f8ab415b2ff0096e8d792")
    end
  end
end
