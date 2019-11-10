require "deploygate/client/response"

module Deploygate
  class Client
    module Organizations

      def organizations
        res = api.get '/api/organizations'
        Response.new(res)
      end

      def add_organization(org_name:, description: nil)
        res = api.post '/api/organizations' do |request|
          request.params[:name] = org_name
          request.params[:description] = description
        end
        Response.new(res)
      end

      def organization(org_name:)
        res = api.get "/api/organizations/#{org_name}"
        Response.new(res)
      end

      def update_organization(org_name:, description: nil)
        res = api.patch "/api/organizations/#{org_name}" do |request|
          request.params[:description] = description
        end
        Response.new(res)
      end

      def delete_organization(org_name:)
        res = api.delete "/api/organizations/#{org_name}"
        Response.new(res)
      end

      def organization_members(org_name:)
        res = api.get "/api/organizations/#{org_name}/members"
        Response.new(res)
      end

      def add_organization_member(org_name:, user_name:)
        res = api.post "/api/organizations/#{org_name}/members" do |request|
          request.params[:username] = user_name
        end
        Response.new(res)
      end

      def add_organization_member_by_email(org_name:, email:)
        res = api.post "/api/organizations/#{org_name}/members" do |request|
          request.params[:email] = email
        end
        Response.new(res)
      end

      def delete_organization_member(org_name:, user_name:)
        res = api.delete "/api/organizations/#{org_name}/members/#{user_name}" do |request|
          request.params[:id] = user_name
        end
        Response.new(res)
      end

      def delete_organization_member_by_email(org_name:, email:)
        res = api.delete "/api/organizations/#{org_name}/members/#{email}" do |request|
          request.params[:id] = email
        end
        Response.new(res)
      end

      def team_members(org_name:, team_name:)
        res = api.get "/api/organizations/#{org_name}/teams/#{team_name}/users"
        Response.new(res)
      end

      def add_team_member(org_name:, team_name:, user_name:)
        res = api.post "/api/organizations/#{org_name}/teams/#{team_name}/users" do |request|
          request.params[:user] = user_name
        end
        Response.new(res)
      end

      def delete_team_member(org_name:, team_name:, user_name:)
        res = api.delete "/api/organizations/#{org_name}/teams/#{team_name}/users/#{user_name}"
        Response.new(res)
      end
    end
  end
end
