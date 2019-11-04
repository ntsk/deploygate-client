require "deploygate/client/version"
require "deploygate/client/api"
require "deploygate/client/response"
require "deploygate/client/config"

module Deploygate
  class Client
    attr_reader :api

    def initialize
      config = Config.new
      @api = API.new(config: config)
    end

    def organizations
      Response.new(api.get_organizations)
    end

    def add_organization(org_name:, description: nil)
      Response.new(api.post_organizations(org_name: org_name, description: description))
    end

    def organization(org_name:)
      Response.new(api.get_organization(org_name: org_name))
    end

    def update_organization(org_name:, description: nil)
      Response.new(api.patch_organization(org_name: org_name, description: description))
    end

    def delete_organization(org_name:)
      Response.new(api.delete_organization(org_name: org_name))
    end

    def organization_members(org_name:)
      Response.new(api.get_organization_members(org_name: org_name))
    end

    def add_member_to_organization(org_name:, user_name: nil, email: nil)
      Response.new(api.post_organization(org_name: org_name, user_name: user_name, email: email))
    end

    def delete_member_from_organization(org_name:, user_id:)
      Response.new(api.delete_organization_member(org_name: org_name, user_id: user_id))
    end

    def team_members(org_name:, team_name:)
      Response.new(get_team_members(org_name: org_name, team_name: team_name))
    end

    def add_member_to_team(org_name:, team_name:, user_name:)
      Response.new(api.post_team_member(org_name: org_name, team_name: team_name, user_name: user_name))
    end

    def delete_member_from_team(org_name:, team_name:, user_name:)
      Response.new(api.delete_team_member(org_name: org_name, team_name: team_name, user_name: user_name))
    end

    def upload_apps(user_name:, file_path:, message: nil, distribution_key: nil, distribution_name: nil, release_note: nil, disable_notify: nil, visibility: nil)
      Response.new(api.post_apps(user_name: user_name, file_path: file_path, message: message, distribution_key: distribution_key, distribution_name: distribution_name, release_note: release_note, disable_notify: disable_notify, visibility: visibility))
    end
  end
end
