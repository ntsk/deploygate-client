require 'faraday'
require 'faraday_middleware'
require 'deploygate/client/api/organizations'

module Deploygate
  class Client
    class API
      include API::Organizations
      BASE_URL = 'https://deploygate.com'

      def initialize(config:)
        @config = config
      end

      def api
        @api ||= Faraday.new(url: BASE_URL) do |builder|
          builder.headers['Authorization'] = "token #{@config.token}"
          builder.adapter Faraday::default_adapter
        end
      end
    end
  end
end
