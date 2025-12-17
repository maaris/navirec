# frozen_string_literal: true

module Navirec
  module Resources
    class Trips < Base
      # List trips
      # Filtering is required - must provide time range parameters
      #
      # @param params [Hash] query parameters
      # @option params [String] :time__range_start start of time range (ISO 8601)
      # @option params [String] :time__range_end end of time range (ISO 8601)
      # @option params [String] :start_time__gte trips starting after this time
      # @option params [String] :start_time__lte trips starting before this time
      # @option params [String] :start_time__gt trips starting after this time (exclusive)
      # @option params [String] :start_time__lt trips starting before this time (exclusive)
      # @option params [Integer] :vehicle filter by vehicle ID
      # @option params [String] :vehicle__in filter by multiple vehicle IDs (comma-separated)
      # @option params [Integer] :driver filter by driver ID
      # @option params [String] :driver__in filter by multiple driver IDs (comma-separated)
      # @option params [Integer] :account filter by account ID
      # @option params [Boolean] :confirmed filter by confirmation status
      # @option params [String] :cursor pagination cursor
      # @option params [String] :format response format (geojson, json)
      # @option params [String] :ordering field to order by
      # @option params [Integer] :page_size number of results per page
      # @option params [String] :search search term
      # @option params [String] :sideload sideload related objects (accounts, areas, drivers, trips, vehicles)
      # @return [Hash] list of trips with pagination
      def list(params = {})
        get("/trips/", params)
      end

      # Find a trip by ID
      #
      # @param id [Integer, String] trip ID
      # @return [Hash] trip data
      def find(id)
        get("/trips/#{id}/")
      end
    end
  end
end
