# frozen_string_literal: true

require_relative "navirec/version"
require_relative "navirec/configuration"
require_relative "navirec/errors"
require_relative "navirec/connection"
require_relative "navirec/client"
require_relative "navirec/resources/base"
require_relative "navirec/resources/drivers"
require_relative "navirec/resources/vehicles"
require_relative "navirec/resources/trips"
require_relative "navirec/resources/report_requests"
require_relative "navirec/resources/composite_reports"

module Navirec
  class << self
    attr_writer :configuration

    # Returns the current configuration
    #
    # @return [Configuration]
    def configuration
      @configuration ||= Configuration.new
    end

    # Configure the Navirec client
    #
    # @yield [Configuration]
    # @example
    #   Navirec.configure do |config|
    #     config.api_token = "your_api_token"
    #   end
    def configure
      yield(configuration)
    end

    # Returns a new client instance
    #
    # @param api_token [String, nil] optional API token (uses configured token if nil)
    # @return [Client]
    def client(api_token: nil)
      Client.new(api_token: api_token)
    end

    # Reset configuration to defaults
    def reset_configuration!
      @configuration = Configuration.new
    end
  end
end
