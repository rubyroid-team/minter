# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::BlockResource do
  describe "block" do
    it "return block info" do
      client = Minter::Api::Client.new
      response = client.block(height: 1)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body).not_to be_nil
      %w[hash height transaction_count transactions block_reward size validators].each do |key|
        expect(response.body[key]).not_to be_nil
      end
    end
  end
end
