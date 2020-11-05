# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::MaxGasResource do
  describe "max_gas" do
    it "return max gas" do
      client = Minter::Api::Client.new
      response = client.max_gas
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
    end
  end
end
