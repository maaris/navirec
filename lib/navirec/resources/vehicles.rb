# frozen_string_literal: true

module Navirec
  module Resources
    class Vehicles < Base
      # List all vehicles
      #
      # @return [Array<Hash>] list of vehicles
      def list
        get("/vehicles/")
      end

      # Find a vehicle by ID
      #
      # @param id [Integer, String] vehicle ID
      # @return [Hash] vehicle data
      def find(id)
        get("/vehicles/#{id}/")
      end
    end
  end
end
