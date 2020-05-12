# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::NonceResource do
  describe "nonce" do
    let(:address) {"Mx251cb0043a0240779103aa7c210f638f887699f8"}
    it "return nonce" do
      client = Minter::Api::Client.new
      nonce = client.nonce(address: address)
      expect(nonce).to be_a(Integer)
      expect(nonce > 0).to be_truthy
    end
  end
end
