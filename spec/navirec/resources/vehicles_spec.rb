# frozen_string_literal: true

RSpec.describe Navirec::Resources::Vehicles do
  let(:api_token) { "test_token" }
  let(:client) { Navirec::Client.new(api_token: api_token) }
  let(:vehicles) { described_class.new(client) }

  describe "#list" do
    it "calls GET /api/v1/vehicles/" do
      expect(client).to receive(:get).with("/vehicles/", {})
      vehicles.list
    end
  end

  describe "#find" do
    it "calls GET /api/v1/vehicles/:id/" do
      expect(client).to receive(:get).with("/vehicles/456/", {})
      vehicles.find(456)
    end
  end
end
