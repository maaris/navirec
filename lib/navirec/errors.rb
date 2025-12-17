# frozen_string_literal: true

module Navirec
  class Error < StandardError
    attr_reader :response

    def initialize(message = nil, response: nil)
      @response = response
      super(message)
    end
  end

  class AuthenticationError < Error; end
  class NotFoundError < Error; end
  class RateLimitError < Error; end
  class ServerError < Error; end
  class ApiError < Error; end
end
