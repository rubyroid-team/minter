# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::AddressResource do
  describe "address" do
    let(:address) { "Mx251cb0043a0240779103aa7c210f638f887699f8" }
    it "get address info" do
      client = Minter::Api::Client.new
      response = client.address(address: address)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["balance"]).not_to be_nil
      expect(response.body["transaction_count"]).not_to be_nil
      expect(response.body["bip_value"]).not_to be_nil
    end
  end

end
