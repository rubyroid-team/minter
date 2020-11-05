# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::TransactionsResource do
  describe "transaction_info" do
    let(:transaction_hash) { "Mt62b2edfc191d279bb7264e019b4784011d7853997f492c0efde0f94fef1851c4" }

    it "return transaction info" do
      client = Minter::Api::Client.new
      response = client.transaction_info(transaction_hash: transaction_hash)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      %w[hash raw_tx height index from nonce gas gas_price gas_coin data].each do |key|
        expect(response.body[key]).not_to be_nil
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
      expect(response.body).to be_a(Hash)
    end
  end

  describe "unconfirmed_transactions" do
    it "return unconfirmed transactions list" do
      client = Minter::Api::Client.new
      response = client.unconfirmed_transactions
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body).to be_a(Hash)
      %w[transaction_count total_transactions total_bytes transactions].each do |key|
        expect(response.body[key]).not_to be_nil
      end
      expect(response.body["transactions"]).to be_a(Array)
    end
  end
end
