# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::EditCandidateTx do
  subject do
    described_class.new(
      pubkey: "Mp4ae1ee73e6136c85b0ca933a9a1347758a334885f10b3238398a67ac2eb153b8",
      reward_address: "Mx89e5dc185e6bab772ac8e00cf3fb3f4cb0931c47",
      owner_address: "Mxe731fcddd37bb6e72286597d22516c8ba3ddffa0",
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
  end

  let(:private_key) { "a3fb55450f53dbbf4f2494280188f7f0cd51a7b51ec27ed49ed364d920e326ba" }
  let(:valid_tx_hash) do
    "0xf8a80102018a4d4e54000000000000000eb84df84ba04ae1ee73e6136c85b0ca933a9a1347758a334885f10b32383" \
    "98a67ac2eb153b89489e5dc185e6bab772ac8e00cf3fb3f4cb0931c4794e731fcddd37bb6e72286597d22516c8ba3dd" \
    "ffa0808001b845f8431ca0421470f27f78231b669c1bf1fcc56168954d64fbb7dc3ff021bab01311fab6eaa075e8636" \
    "5d98c87e806fcbc5c542792f569e19d8ae7af671d9ba4679acc86d35e"
  end

  describe "#sign" do
    it "returns signed transaction" do
      signed_tx = subject.sign(private_key)
      expect(signed_tx.tx_hash).to eq(valid_tx_hash)
    end
  end
end
