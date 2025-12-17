# frozen_string_literal: true

RSpec.describe Navirec::Client do
  let(:api_token) { "test_token" }
  let(:client) { described_class.new(api_token: api_token) }

  describe "#initialize" do
    it "creates a client with provided token" do
      expect(client).to be_a(Navirec::Client)
    end

    it "raises error without token" do
      expect { described_class.new(api_token: nil) }.to raise_error(Navirec::AuthenticationError)
    end

    it "raises error with empty token" do
      expect { described_class.new(api_token: "") }.to raise_error(Navirec::AuthenticationError)
    end
  end

  describe "#drivers" do
    it "returns Drivers resource" do
      expect(client.drivers).to be_a(Navirec::Resources::Drivers)
    end
  end

  describe "#vehicles" do
    it "returns Vehicles resource" do
      expect(client.vehicles).to be_a(Navirec::Resources::Vehicles)
    end
  end
end
