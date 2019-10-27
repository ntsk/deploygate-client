require 'faraday'
require 'faraday_middleware'
require 'deploygate/client/api/organizations'
require 'deploygate/client/api/apps'

module Deploygate
  class Client
    class API
      include API::Organizations
      include API::Apps

      BASE_URL = 'https://deploygate.com'

      def initialize(config:)
        @config = config
      end

      def api
        @api ||= Faraday.new(url: BASE_URL) do |builder|
          builder.request :multipart
          builder.headers['Authorization'] = "token #{@config.token}"
          builder.adapter Faraday::default_adapter
        end
      end
    end
  end
end
