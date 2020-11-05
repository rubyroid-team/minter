# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::CandidateResource do
  describe "candidate" do
    let(:public_key) { "Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5" }
    it "return candidate info" do
      client = Minter::Api::Client.new
      response = client.candidate(public_key: public_key)
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body).not_to be_nil
      %w[reward_address owner_address control_address total_stake public_key commission used_slots uniq_users min_stake stakes status].each do |key|
        expect(response.body[key]).not_to be_nil
      end
    end
  end

  describe "candidates" do
    it "return candidates list" do
      client = Minter::Api::Client.new
      response = client.candidates
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["candidates"]).to be_a(Array)
    end
  end
end
