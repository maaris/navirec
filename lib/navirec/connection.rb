# frozen_string_literal: true

require "faraday"
require "faraday/retry"
require "json"

module Navirec
  class Connection
    def initialize(api_token:, base_url:, timeout:, api_version:)
      @api_token = api_token
      @base_url = base_url
      @timeout = timeout
      @api_version = api_version
    end

    def get(path, params = {})
      response = connection.get(path, params)
      handle_response(response)
    end

    private

    def connection
      @connection ||= Faraday.new(url: @base_url) do |conn|
        conn.request :retry, max: 2, interval: 0.5, backoff_factor: 2
        conn.headers["Authorization"] = "Token #{@api_token}"
        conn.headers["Content-Type"] = "application/json"
        conn.headers["Accept"] = "application/json; version=#{@api_version}"
        conn.headers["User-Agent"] = "UnicentrsSistema/RubyClient"
        conn.options.timeout = @timeout
        conn.adapter Faraday.default_adapter
      end
    end

    def handle_response(response)
      case response.status
      when 200..299
        parse_json(response.body)
      when 401
        raise AuthenticationError.new("Invalid or missing API token", response: response)
      when 404
        raise NotFoundError.new("Resource not found", response: response)
      when 429
        raise RateLimitError.new("Rate limit exceeded", response: response)
      when 500..599
        raise ServerError.new("Server error: #{response.status}", response: response)
      else
        raise ApiError.new("API error: #{response.status}", response: response)
      end
    end

    def parse_json(body)
      return {} if body.nil? || body.empty?

      JSON.parse(body, symbolize_names: true)
    rescue JSON::ParserError
      { raw: body }
    end
  end
end
