# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Wallet do
  describe "new" do
    context "without mnemonic" do
      it "create wallet" do
        wallet = Minter::Wallet.new
        expect(wallet.mnemonic).not_to be_nil
        expect(wallet.address).not_to be_nil
        expect(wallet.private_key).not_to be_nil
        expect(wallet.public_key).not_to be_nil
      end
    end

    context "with mnemonic" do
      let(:mnemonic) { "oppose gym crucial devote skin robust exile antique split clean bright move" }
      let(:correct_address) { "Mx251cb0043a0240779103aa7c210f638f887699f8" }
      let(:correct_private_key) { "290cd647206bea71ec06d8dfacce30c872aea3fb1ea333b7f475b70467250ca0" }
      let(:correct_public_key) { "Mp4d2900d19ee3ce815bdb38daa3bc8d15c2bbe4945c3cdfac80df3ae6da31464be5ae6cecf2c5e8901d71e94009dd6d177953c53f7de1fd5686afb11585c8ac4f" }

      it "create wallet from mnemonic" do
        wallet = Minter::Wallet.new(mnemonic)
        expect(wallet.mnemonic).to eq mnemonic
        expect(wallet.address).to eq correct_address
        expect(wallet.private_key).to eq correct_private_key
        expect(wallet.public_key).to eq correct_public_key
      end
    end
  end
end
