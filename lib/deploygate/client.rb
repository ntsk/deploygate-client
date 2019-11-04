require "deploygate/client/version"
require "deploygate/client/config"
require "deploygate/client/api"
require "deploygate/client/apps"
require "deploygate/client/organizations"

module Deploygate
  class Client
    include Deploygate::Client::API
    include Deploygate::Client::Apps
    include Deploygate::Client::Organizations

    attr_reader :symbolize_response, :open_timeout, :timeout

    def initialize(options = {})
      @symbolize_response = options[:symbolize_response] || false
      @open_timeout = options[:open_timeout] || 10
      @timeout = options[:timeout] || 30
    end
  end
end
