# frozen_string_literal: true

module Navirec
  class Configuration
    attr_accessor :api_token, :base_url, :timeout, :api_version, :timezone

    def initialize
      @base_url = "https://api.navirec.com"
      @timeout = 30
      @api_version = "1.45.0"
      @timezone = "UTC"
    end
  end
end

