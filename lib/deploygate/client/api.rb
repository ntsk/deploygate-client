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
          builder.request :multipart
          builder.headers['Authorization'] = "token #{token}"
          builder.adapter Faraday::default_adapter
          #builder.response :json, parser_options: { symbolize_names: true }
        end
      end
    end
  end
end
