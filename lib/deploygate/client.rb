require "deploygate/client/version"
require "deploygate/client/api"
require "deploygate/client/config"

module Deploygate
  class Client
    def initialize
      config = Config.new
      @api = API.new(config: config)
    end

    def get_groups
      @api.get_groups
    end
  end
end
