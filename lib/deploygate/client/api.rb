# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Deploygate
  class Client
    # Default faraday settings
    module API
      BASE_URL = 'https://deploygate.com'

      private

      def api
        @api ||= Faraday.new(url: BASE_URL) do |builder|
          builder.options.open_timeout = open_timeout
          builder.options.timeout = timeout

          builder.request :multipart

          if symbolize_response
            builder.response :json, parser_options: { symbolize_names: true }
          end

          builder.headers['Authorization'] = "token #{token}"
          builder.adapter Faraday.default_adapter
        end
      end
    end
  end
end
