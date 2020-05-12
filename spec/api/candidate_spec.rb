# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::CandidateResource do
  describe "candidate" do
    let(:public_key) { "Mp4d2900d19ee3ce815bdb38daa3bc8d15c2bbe4945c3cdfac80df3ae6da31464b" }
    it "return candidate info" do
      client = Minter::Api::Client.new
      response = client.candidate(public_key: public_key)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
      %w[reward_address owner_address total_stake pub_key commission stakes status].each do |key|
        expect(response.body["result"][key]).not_to be_nil
      end
    end
  end

  describe "candidates" do
    it "return candidates list" do
      client = Minter::Api::Client.new
      response = client.candidates
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["result"]).not_to be_nil
      expect(response.body["result"]).to be_a(Array)
    end
  end
end
