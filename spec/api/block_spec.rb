# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::BlockResource do
  describe "block" do
    it "return block info" do
      client = Minter::Api::Client.new
      response = client.block(height: 1)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
      ["hash", "height", "num_txs", "transactions", "block_reward", "size"].each do |key|
        expect(response.body["result"][key]).not_to be_nil
      end
    end
  end
end
