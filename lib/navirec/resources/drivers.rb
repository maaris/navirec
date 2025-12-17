# frozen_string_literal: true

module Navirec
  module Resources
    class Drivers < Base
      # List all drivers
      #
      # @return [Array<Hash>] list of drivers
      def list
        get("/drivers/")
      end

      # Find a driver by ID
      #
      # @param id [Integer, String] driver ID
      # @return [Hash] driver data
      def find(id)
        get("/drivers/#{id}/")
      end
    end
  end
end
