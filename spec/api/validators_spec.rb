# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::ValidatorsResource do
  describe "validators" do
    it "return validators list" do
      client = Minter::Api::Client.new
      response = client.validators
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
      expect(response.body["result"]).to be_a(Array)
      expect(response.body["result"].first["pub_key"]).not_to be_nil
    end
  end
end
