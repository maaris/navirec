# frozen_string_literal: true

module Navirec
  module Resources
    class Trips < Base
      # List trips
      # Filtering is required - must apply one of: account, vehicle, vehicle__in, driver, driver__in
      #
      # @param params [Hash] query parameters
      # @option params [Integer] :account filter by account ID (required filter option)
      # @option params [Integer] :vehicle filter by vehicle ID (required filter option)
      # @option params [String] :vehicle__in filter by multiple vehicle IDs (required filter option)
      # @option params [Integer] :driver filter by driver ID (required filter option)
      # @option params [String] :driver__in filter by multiple driver IDs (required filter option)
      # @option params [Boolean] :confirmed filter by confirmation status
      # @option params [String] :cursor pagination cursor value
      # @option params [String] :format response format ("geojson" or "json")
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
