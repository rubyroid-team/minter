# frozen_string_literal: true

require "spec_helper"

RSpec.describe Minter::Api::EventsResource do
  describe "events" do
    it "return events list" do
      client = Minter::Api::Client.new
      response = client.events
      expect(response.status).to eq 200
      expect(response.body).not_to be_nil
      expect(response.body["events"]).to be_a(Array)
    end
  end
end
