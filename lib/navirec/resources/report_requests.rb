# frozen_string_literal: true

module Navirec
  module Resources
    class ReportRequests < Base
      # List all report requests
      #
      # @param params [Hash] query parameters
      # @option params [String] :report_type filter by type (composite, trip, latvia_srs, tanking, vehicle_event, expense, resolution, sensor_data, notification)
      # @option params [Boolean] :saved filter by saved status
      # @option params [Boolean] :is_recurring filter by recurring status
      # @return [Hash] list of report requests
      def list(params = {})
        get("/report_requests/", params)
      end

      # Find a report request by ID
      #
      # @param id [String] report request UUID
      # @param params [Hash] query parameters
      # @return [Hash] report request data
      def find(id, params = {})
        get("/report_requests/#{id}/", params)
      end
    end
  end
end
