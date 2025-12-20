# frozen_string_literal: true

module Navirec
  module Resources
    class Trips < Base
      # List trips
      # Time filtering is required - must apply one of: time__range_start, time__range_end, 
      # start_time__lt, start_time__lte, start_time__gt, start_time__gte
      #
      # @param params [Hash] query parameters
      # @option params [String] :start_time__gte filter trips starting after this ISO8601 datetime (required)
      # @option params [String] :start_time__lte filter trips starting before this ISO8601 datetime
      # @option params [String] :start_time__gt filter trips starting after this ISO8601 datetime (exclusive)
      # @option params [String] :start_time__lt filter trips starting before this ISO8601 datetime (exclusive)
      # @option params [String] :time__range_start filter by time range start
      # @option params [String] :time__range_end filter by time range end
      # @option params [Integer] :vehicle filter by vehicle ID
      # @option params [String] :vehicle__in filter by multiple vehicle IDs
      # @option params [Integer] :driver filter by driver ID
      # @option params [String] :driver__in filter by multiple driver IDs
      # @option params [Boolean] :confirmed filter by confirmation status
      # @option params [String] :cursor pagination cursor value
      # @option params [String] :format response format ("geojson" or "json")
      # @option params [String] :ordering field to order by
      # @option params [Integer] :page_size number of results per page (max 1000)
      # @option params [String] :search search term
      # @option params [String] :sideload sideload related objects (accounts, areas, drivers, trips, vehicles)
      # @return [Hash] list of trips with pagination
      def list(params = {})
        get("/trips/", params)
      end

      # Find a trip by ID
      #
      # @param id [String] trip UUID
      # @param params [Hash] query parameters
      # @option params [String] :format response format ("geojson" or "json")
      # @option params [String] :sideload sideload related objects (accounts, areas, drivers, trips, vehicles)
      # @return [Hash] trip data
      def find(id, params = {})
        get("/trips/#{id}/", params)
      end
    end
  end
end
