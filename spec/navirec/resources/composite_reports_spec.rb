# frozen_string_literal: true

RSpec.describe Navirec::Resources::CompositeReports do
  let(:api_token) { "test_token" }
  let(:client) { Navirec::Client.new(api_token: api_token) }
  let(:resource) { described_class.new(client) }

  describe "#list" do
    it "calls GET /reports/composite/ with params" do
      expect(client).to receive(:get).with("/reports/composite/", { page_size: 10 }, { "Accept" => "application/json" })
      resource.list(page_size: 10)
    end
  end

  describe "#find" do
    it "calls GET /reports/composite/:id/" do
      uuid = "497f6eca-6276-4993-bfeb-53cbbbba6f08"
      expect(client).to receive(:get).with("/reports/composite/#{uuid}/", {}, { "Accept" => "application/json" })
      resource.find(uuid)
    end
  end

  describe "#data" do
    it "calls GET /reports/composite/:id/data/" do
      uuid = "497f6eca-6276-4993-bfeb-53cbbbba6f08"
      expect(client).to receive(:get).with("/reports/composite/#{uuid}/data/", {}, { "Accept" => "application/json" })
      resource.data(uuid)
    end
  end
end
