# frozen_string_literal: true

RSpec.describe Navirec::Resources::Drivers do
  let(:api_token) { "test_token" }
  let(:client) { Navirec::Client.new(api_token: api_token) }
  let(:drivers) { described_class.new(client) }

  describe "#list" do
    it "calls GET /api/v1/drivers/" do
      expect(client).to receive(:get).with("/drivers/", {})
      drivers.list
    end
  end

  describe "#find" do
    it "calls GET /api/v1/drivers/:id/" do
      expect(client).to receive(:get).with("/drivers/123/", {})
      drivers.find(123)
    end
  end
end
