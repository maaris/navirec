# frozen_string_literal: true

module Navirec
  class Client
    attr_reader :connection

    def initialize(api_token: nil)
      token = api_token || Navirec.configuration.api_token
      raise AuthenticationError, "API token is required" if token.nil? || token.empty?

      @connection = Connection.new(
        api_token: token,
        base_url: Navirec.configuration.base_url,
        timeout: Navirec.configuration.timeout,
        api_version: Navirec.configuration.api_version,
        timezone: Navirec.configuration.timezone
      )
    end

    def drivers
      Resources::Drivers.new(self)
    end

    def vehicles
      Resources::Vehicles.new(self)
    end

    def trips
      Resources::Trips.new(self)
    end

    def report_requests
      Resources::ReportRequests.new(self)
    end

    def composite_reports
      Resources::CompositeReports.new(self)
    end

    def get(path, params = {}, headers = {})
      connection.get(path, params, headers)
    end
  end
end
