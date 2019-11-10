require "deploygate/client/response"

module Deploygate
  class Client
    # Request to application endpoints
    module Organizations

      # Get a list of organizations.
      # @see https://docs.deploygate.com/reference#organizations-index
      #
      # @return [Deploygate::Client::Response]
      def organizations
        res = api.get '/api/organizations'
        Response.new(res)
      end

      # Create an organization.
      # @see https://docs.deploygate.com/reference#organizations-index
      #
      # @param org_name [String] Organization name
      # @option description [String] Organization description
      # @return [Deploygate::Client::Response]
      def add_organization(org_name:, description: nil)
        res = api.post '/api/organizations' do |request|
          request.params[:name] = org_name
          request.params[:description] = description
        end
        Response.new(res)
      end

      # Get organization information.
      # @see https://docs.deploygate.com/reference#organizations-show
      #
      # @param org_name [String] Organization name
      # @return [Deploygate::Client::Response]
      def organization(org_name:)
        res = api.get "/api/organizations/#{org_name}"
        Response.new(res)
      end

      # Update organization information.
      # @see https://docs.deploygate.com/reference#organizations-update
      #
      # @param org_name [String] Organization name
      # @option description [String] Organization description
      # @return [Deploygate::Client::Response]
      def update_organization(org_name:, description: nil)
        res = api.patch "/api/organizations/#{org_name}" do |request|
          request.params[:description] = description
        end
        Response.new(res)
      end

      # Delete organization information.
      # @see https://docs.deploygate.com/reference#organizations-destroy
      #
      # @param org_name [String] Organization name
      # @return [Deploygate::Client::Response]
      def delete_organization(org_name:)
        res = api.delete "/api/organizations/#{org_name}"
        Response.new(res)
      end

      # Get a list of organization members.
      # @see https://docs.deploygate.com/reference#organizations-members-index
      #
      # @param org_name [String] Organization name
      # @return [Deploygate::Client::Response]
      def organization_members(org_name:)
        res = api.get "/api/organizations/#{org_name}/members"
        Response.new(res)
      end

      # Add members to the organization.
      # @see https://docs.deploygate.com/reference#organizations-members-create
      #
      # @param org_name [String] Organization name
      # @param user_name [String] User name
      # @return [Deploygate::Client::Response]
      def add_organization_member(org_name:, user_name:)
        res = api.post "/api/organizations/#{org_name}/members" do |request|
          request.params[:username] = user_name
        end
        Response.new(res)
      end

      # Add members to the organization.
      # @see https://docs.deploygate.com/reference#organizations-members-create
      #
      # @param org_name [String] Organization name
      # @param email [String] User email
      # @return [Deploygate::Client::Response]
      def add_organization_member_by_email(org_name:, email:)
        res = api.post "/api/organizations/#{org_name}/members" do |request|
          request.params[:email] = email
        end
        Response.new(res)
      end

      # Delete members to the organization.
      # @see https://docs.deploygate.com/reference#organizations-members-destroy
      #
      # @param org_name [String] Organization name
      # @param user_name [String] User name
      # @return [Deploygate::Client::Response]
      def delete_organization_member(org_name:, user_name:)
        res = api.delete "/api/organizations/#{org_name}/members/#{user_name}" do |request|
          request.params[:id] = user_name
        end
        Response.new(res)
      end

      # Delete members from the organization.
      # @see https://docs.deploygate.com/reference#organizations-members-destroy
      #
      # @param org_name [String] Organization name
      # @param email [String] User email
      # @return [Deploygate::Client::Response]
      def delete_organization_member_by_email(org_name:, email:)
        res = api.delete "/api/organizations/#{org_name}/members/#{email}" do |request|
          request.params[:id] = email
        end
        Response.new(res)
      end

      # Get a list of team members.
      # @see https://docs.deploygate.com/reference#organizations-teams-users-index
      #
      # @param org_name [String] Organization name
      # @param team_name [String] Team name
      # @return [Deploygate::Client::Response]
      def team_members(org_name:, team_name:)
        res = api.get "/api/organizations/#{org_name}/teams/#{team_name}/users"
        Response.new(res)
      end

      # Add members to the team.
      # @see https://docs.deploygate.com/reference#organizations-teams-users-create
      #
      # @param org_name [String] Organization name
      # @param team_name [String] Team name
      # @param user_name [String] User name
      # @return [Deploygate::Client::Response]
      def add_team_member(org_name:, team_name:, user_name:)
        res = api.post "/api/organizations/#{org_name}/teams/#{team_name}/users" do |request|
          request.params[:user] = user_name
        end
        Response.new(res)
      end

      # Delete members from the team.
      # @see https://docs.deploygate.com/reference#organizations-teams-users-destroy
      #
      # @param org_name [String] Organization name
      # @param team_name [String] Team name
      # @param user_name [String] User name
      # @return [Deploygate::Client::Response]
      def delete_team_member(org_name:, team_name:, user_name:)
        res = api.delete "/api/organizations/#{org_name}/teams/#{team_name}/users/#{user_name}"
        Response.new(res)
      end
    end
  end
end
