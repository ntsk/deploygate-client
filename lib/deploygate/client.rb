require "deploygate/client/version"
require "deploygate/client/api"
require "deploygate/client/config"

module Deploygate
  class Client
    def initialize
      config = Config.new
      @api = API.new(config: config)
    end

    def organizations
      @api.get_organizations
    end

    def create_organization(org_name:, description: nil)
      @api.post_organizations(org_name: org_name, description: description)
    end

    def organization(org_name:)
      @api.get_organization(org_name: name)
    end

    def update_organization(org_name:, description: nil)
      @api.patch_organization(org_name: org_name, description: description)
    end
  end
end
