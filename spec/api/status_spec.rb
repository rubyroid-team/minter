# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::StatusResource do
  describe "status" do
    it "return status" do
      client = Minter::Api::Client.new
      response = client.status
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
      %w[version latest_block_hash latest_app_hash latest_block_height latest_block_time keep_last_states tm_status].each do |key|
        expect(response.body["result"][key]).not_to be_nil
      end
    end
  end
end
