# frozen_string_literal: true

module Navirec
  module Resources
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def get(path, params = {}, headers = {})
        client.get(path, params, headers)
      end
    end
  end
end
