require 'faraday'

module Deploygate
  class Client
    class API
      BASE_URL = 'https://deploygate.com'

      def initialize(config:)
        @config = config
        @api ||= Faraday.new(url: BASE_URL)
      end

      def get_groups
        @api.get '/api/organizations' do |request|
          request.params[:token] = @config.token
        end
      end

    end
  end
end
