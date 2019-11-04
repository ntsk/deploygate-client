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
  end
end
