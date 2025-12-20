# frozen_string_literal: true

RSpec.describe Navirec::Resources::ReportRequests do
  let(:api_token) { "test_token" }
  let(:client) { Navirec::Client.new(api_token: api_token) }
  let(:resource) { described_class.new(client) }

  describe "#list" do
    it "calls GET /report_requests/ with params" do
      expect(client).to receive(:get).with("/report_requests/", { report_type: "trip" }, {})
      resource.list(report_type: "trip")
    end
  end

  describe "#find" do
    it "calls GET /report_requests/:id/" do
      uuid = "497f6eca-6276-4993-bfeb-53cbbbba6f08"
      expect(client).to receive(:get).with("/report_requests/#{uuid}/", {}, {})
      resource.find(uuid)
    end
  end
end
