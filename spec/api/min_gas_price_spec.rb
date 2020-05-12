# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::MinGasPriceResource do
  describe "max_gas" do
    it "return min gas price" do
      client = Minter::Api::Client.new
      response = client.min_gas_price
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
    end
  end
end
