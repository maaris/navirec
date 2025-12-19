# frozen_string_literal: true

RSpec.describe Navirec do
  it "has a version number" do
    expect(Navirec::VERSION).not_to be_nil
  end

  describe ".configuration" do
    it "returns a Configuration instance" do
      expect(Navirec.configuration).to be_a(Navirec::Configuration)
    end

    it "has default values" do
      config = Navirec.configuration
      expect(config.base_url).to eq("https://api.navirec.com")
      expect(config.timeout).to eq(30)
      expect(config.timezone).to eq("UTC")
    end
  end

  describe ".configure" do
    after { Navirec.reset_configuration! }

    it "yields the configuration" do
      Navirec.configure do |config|
        config.api_token = "test_token"
      end

      expect(Navirec.configuration.api_token).to eq("test_token")
    end
  end

  describe ".client" do
    it "raises error without API token" do
      Navirec.reset_configuration!
      expect { Navirec.client }.to raise_error(Navirec::AuthenticationError)
    end

    it "returns a Client with configured token" do
      Navirec.configure { |c| c.api_token = "test_token" }
      expect(Navirec.client).to be_a(Navirec::Client)
    end
  end
end
