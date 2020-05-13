# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::ValidatorsResource do
  describe "transaction_info" do
    let(:transaction_hash) { "Mt56c1957d15bf4143f7cd180f837bce51564a054cfbdaf5c5e179f9b0aad8e8b2" }

    it "return transaction info" do
      client = Minter::Api::Client.new
      response = client.transaction_info(transaction_hash: transaction_hash)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
      %w[hash raw_tx height index from nonce gas gas_price gas_coin data payload].each do |key|
        expect(response.body["result"][key]).not_to be_nil
      end
    end
  end

  describe "transactions" do
    let(:query) { "tags.tx.coin='MNT'" }
    let(:page) { 1 }
    let(:per_page) { 1 }

    it "return transactions list" do
      client = Minter::Api::Client.new
      response = client.transactions(query: query, page: page, per_page: per_page)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).to be_a(Array)
    end
  end

  describe "unconfirmed_transactions" do
    it "return unconfirmed transactions list" do
      client = Minter::Api::Client.new
      response = client.unconfirmed_transactions
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).to be_a(Hash)
      %w[n_txs total total_bytes txs].each do |key|
        expect(response.body["result"][key]).not_to be_nil
      end
      expect(response.body["result"]["txs"]).to be_a(Array)
    end
  end
end
