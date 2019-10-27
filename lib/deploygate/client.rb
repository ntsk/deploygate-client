require "deploygate/client/version"
require "deploygate/client/api"
require "deploygate/client/config"

module Deploygate
  class Client
    def initialize
      config = Config.new
      @api = API.new(config: config)
    end

    def get_organizations
      @api.get_organizations
    end

    def create_organization(org_name:, description: nil)
      @api.post_organizations(org_name: org_name, description: description)
    end

    def get_organization(org_name:)
      @api.get_organization(org_name: name)
    end

    def update_organization(org_name:, description: nil)
      @api.patch_organization(org_name: org_name, description: description)
    end

    def delete_organization(org_name:)
      @api.delete_organization(org_name: org_name)
    end

    def get_organization_members(org_name:)
      @api.get_organization_members(org_name: org_name)
    end

    def add_member_to_organization(org_name:, user_name: nil, email: nil)
      @api.post_organization(org_name: org_name, user_name: user_name, email: email)
    end

    def delete_member_from_organization(org_name:, user_id:)
      @api.delete_organization_member(org_name: org_name, user_id: user_id)
    end

    def get_team_members(org_name:, team_name:)
      @api.get_team_members(org_name: org_name, team_name: team_name)
    end

    def add_member_to_team(org_name:, team_name:, user_name:)
      @api.post_team_member(org_name: org_name, team_name: team_name, user_name: user_name)
    end

    def delete_member_from_team(org_name:, team_name:, user_name:)
      @api.delete_team_member(org_name: org_name, team_name: team_name, user_name: user_name)
    end

    def upload_apps(user_name:, file_path:, message: nil, distribution_key: nil, distribution_name: nil, release_note: nil, disable_notify: nil, visibility: nil)
      @api.post_apps(user_name: user_name, file_path: file_path, message: message, distribution_key: distribution_key, distribution_name: distribution_name, release_note: release_note, disable_notify: disable_notify, visibility: visibility)
    end
  end
end
