require "deploygate/client/response"

module Deploygate
  class Client
    module Apps
      PLATFORM_ANDROID = 'android'
      PLATFORM_IOS = 'ios'
      ROLE_DEVELOPER = 1
      ROLE_TESTER = 2

      def add_app(owner:, file_path:, message: nil, distribution_key: nil, distribution_name: nil, release_note: nil, disable_notify: nil, visibility: nil)
        res = api.post "/api/users/#{owner}/apps" do |request|
          request.body = {
            file: Faraday::UploadIO.new(file_path, 'octet/stream')
          }
        end
        Response.new(res)
      end

      def add_app_members(owner:, platform:, app_id:, users:, role: nil)
        res = api.post "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members" do |request|
          request.body = {
            users: users,
            role: role
          }
        end
        Response.new(res)
      end

      def app_members(owner:, platform:, app_id:)
        res = api.get "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members"
        Response.new(res)
      end

      def delete_app_members(owner:, platform:, app_id:, users:)
        res = api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members" do |request|
          request.body = {
            users: users
          }
        end
        Response.new(res)
      end

      def app_teams(org_name:, platform:, app_id:)
        res = api.get "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/teams"
        Response.new(res)
      end

      def add_app_team(org_name:, platform:, app_id:, team:)
        res = api.post "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/teams" do |request|
          request.body = {
            team: team
          }
        end
        Response.new(res)
      end

      def delete_app_team(org_name:, platform:, app_id:, team:)
        res = api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/teams/#{team}"
        Response.new(res)
      end

      def delete_app_distribution(owner:, platform:, app_id:, dist_name:)
        res = api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/distributions" do |request|
          request.body = {
            distribution_name: dist_name
          }
        end
        Response.new(res)
      end
    end
  end
end
