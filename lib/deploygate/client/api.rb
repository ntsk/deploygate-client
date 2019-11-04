require 'faraday'
require 'faraday_middleware'

module Deploygate
  class Client
    module API
      BASE_URL = 'https://deploygate.com'

      def token
        ENV["DEPLOYGATE_TOKEN"]
      end

      private

      def api
        @api ||= Faraday.new(url: BASE_URL) do |builder|
          builder.options.open_timeout = open_timeout
          builder.options.timeout = timeout
          builder.request :multipart
          builder.response :json, parser_options: { symbolize_names: true } if symbolize_response
          builder.headers['Authorization'] = "token #{token}"
          builder.adapter Faraday::default_adapter
        end
      end
    end
  end
end
