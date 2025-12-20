# frozen_string_literal: true

module Navirec
  module Resources
    class CompositeReports < Base
      # List composite reports
      #
      # @param params [Hash] query parameters
      # @return [Hash] list of composite reports
      def list(params = {})
        get("/reports/composite/", params)
      end

      # Find a composite report by ID
      #
      # @param id [String] composite report UUID
      # @param params [Hash] query parameters
      # @return [Hash] composite report data
      def find(id, params = {})
        get("/reports/composite/#{id}/", params)
      end

      # Fetch report data/results for a composite report
      #
      # @param id [String] composite report UUID
      # @param params [Hash] query parameters
      # @return [Hash] report data
      def data(id, params = {})
        get("/reports/composite/#{id}/data/", params)
      end
    end
  end
end
