# frozen_string_literal: true

RSpec.describe Navirec::Resources::Trips do
  let(:api_token) { "test_token" }
  let(:client) { Navirec::Client.new(api_token: api_token) }
  let(:trips) { described_class.new(client) }

  describe "#list" do
    it "calls GET /trips/ with params" do
      expect(client).to receive(:get).with("/trips/", { vehicle: 123 })
      trips.list(vehicle: 123)
    end
  end

  describe "#find" do
    it "calls GET /trips/:id/" do
      expect(client).to receive(:get).with("/trips/abc-123/", {})
      trips.find("abc-123")
    end

    it "calls GET /trips/:id/ with params" do
      expect(client).to receive(:get).with("/trips/abc-123/", { format: "geojson" })
      trips.find("abc-123", format: "geojson")
    end
  end
end
