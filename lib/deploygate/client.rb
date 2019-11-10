# frozen_string_literal: true

require 'deploygate/client/version'
require 'deploygate/client/api'
require 'deploygate/client/apps'
require 'deploygate/client/organizations'

module Deploygate
  # Client for the Deploygate API
  #
  # @see https://docs.deploygate.com/reference#deploygate-api
  class Client
    include Deploygate::Client::API
    include Deploygate::Client::Apps
    include Deploygate::Client::Organizations

    attr_reader :token, :symbolize_response, :open_timeout, :timeout

    # Use options passed in
    #
    # @param token [String] DeployGate API token
    # @option symbolize_response [Boolean] Parse response to symbolized hash
    # @option open_timeout [Integer] Open timeout Integer in seconds
    # @option timeout [Integer] Read timeout Integer in seconds
    # @return [Deploygate::Client]
    def initialize(token:, symbolize_response: false, open_timeout: 10, timeout: 30)
      @token = token
      @symbolize_response = symbolize_response
      @open_timeout = open_timeout
      @timeout = timeout
    end
  end
end
