# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::EditCandidateTx do
  subject do
    described_class.new(
      pubkey: "Mp4ae1ee73e6136c85b0ca933a9a1347758a334885f10b3238398a67ac2eb153b8",
      reward_address: "Mx89e5dc185e6bab772ac8e00cf3fb3f4cb0931c47",
      owner_address: "Mxe731fcddd37bb6e72286597d22516c8ba3ddffa0",
      control_address: "Mx1b685a7c1e78726c48f619c497a07ed75fe00483",
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
  end

  let(:private_key) { "a3fb55450f53dbbf4f2494280188f7f0cd51a7b51ec27ed49ed364d920e326ba" }
  let(:valid_tx_hash) do
    "0xf8b3010201010eb862f860a04ae1ee73e6136c85b0ca933a9a1347758a334885f10b3238398a67ac2eb153b89489e5dc185e6bab772ac8e00cf3fb3f4cb0931c4794e731fcddd37bb6e72286597d22516c8ba3ddffa0941b685a7c1e78726c48f619c497a07ed75fe00483808001b845f8431ca0e88140aadd6cdc38d5ff59e2be43d1d7dfe118b85faa435e04f27d29e3e3f7caa014db705d5e6be34931515744a42080be80a60e39a85d9ebbbb2e977b83cf78c6"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
