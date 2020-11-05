# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::SendTransactionResource do
  describe "send_transaction" do
    it "send transaction to blockchain" do
      client = Minter::Api::Client.new

      mnemonic = "oppose gym crucial devote skin robust exile antique split clean bright move"
      sender_address = Minter::Key.address_from_mnemonic(mnemonic)
      sender_private_key = Minter::Key.private_key_from_mnemonic(mnemonic)
      nonce = client.nonce(address: sender_address)

      receiver_address = "Mxeeee1973381ab793719fff497b9a516719fcd5a2"

      transaction = Minter::SendCoinTx.new(
        address_to: receiver_address,
        value: 1_000_000_000_000_000,
        coin: 0,
        nonce: nonce,
        chain_id: 2,
        gas_coin: 0,
        gas_price: 1
      )
      response = transaction.sign(sender_private_key).send
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      %w[code log hash].each do |key|
        expect(response.body[key]).not_to be_nil
      end
    end
  end
end
