require "deploygate/client/response"

module Deploygate
  class Client
    module Apps
      PLATFORM_ANDROID = 'android'
      PLATFORM_IOS = 'ios'
      ROLE_DEVELOPER = 1
      ROLE_TESTER = 2

      # Upload an application binary file.
      # @see https://docs.deploygate.com/reference#upload
      #
      # @param owner [String] User or organization name
      # @param file_path [String] Application binary file (ipa/apk)
      # @option message [String] Description of the file
      # @option dist_key [String] Distribution page hash
      # @option dist_name [String] Distribution page name
      # @option release_note [String] Message when updating app on distribution page
      # @option disable_notify [Boolean] Email notification when pushing (only ios)
      # @option visibility [String] Application privacy settings (private/public)
      # @return [Deploygate::Client::Response]
      def upload_app(owner:, file_path:, message: nil, dist_key: nil, dist_name: nil, release_note: nil, disable_notify: nil, visibility: nil)
        res = api.post "/api/users/#{owner}/apps" do |request|
          request.body = {
            file: Faraday::UploadIO.new(file_path, 'octet/stream'),
            message: message,
            distribution_key: dist_key,
            distribution_name: dist_name,
            release_note: release_note,
            disable_notify: disable_notify,
            visibility: visibility
          }
        end
        Response.new(res)
      end

      # Invite users to the app.
      # @see https://docs.deploygate.com/reference#invite
      #
      # @param owner [String] User or organization name
      # @param platform [String] Application platform (ios/android)
      # @param app_id [String] Application package name
      # @param users [String] User name or email (You can specify multiple values separated by commas)
      # @option role[String] 1(developer) or 2(tester)
      # @return [Deploygate::Client::Response]
      def add_app_members(owner:, platform:, app_id:, users:, role: nil)
        res = api.post "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members" do |request|
          request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
          request.body = URI.encode_www_form(
            {
              users: users,
              role: role
            }
          )
        end
        Response.new(res)
      end

      # Get a list of members participating in the app.
      # @see https://docs.deploygate.com/reference#apps-members-index
      #
      # @param owner [String] User or organization name
      # @param platform [String] Application platform (ios/android)
      # @param app_id [String] Application package name
      # @return [Deploygate::Client::Response]
      def app_members(owner:, platform:, app_id:)
        res = api.get "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members"
        Response.new(res)
      end

      # Delete members from the app.
      # @see https://docs.deploygate.com/reference#apps-members-destroy
      #
      # @param owner [String] User or organization name
      # @param platform [String] Application platform (ios/android)
      # @param app_id [String] Application package name
      # @param users [String] User name or email (You can specify multiple values separated by commas)
      # @return [Deploygate::Client::Response]
      def delete_app_members(owner:, platform:, app_id:, users:)
        res = api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members" do |request|
          request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
          request.body = URI.encode_www_form(
            {
              users: users
            }
          )
        end
        Response.new(res)
      end

      # Get a list of teams participating in the app.
      # @see https://docs.deploygate.com/reference#apps-teams-index
      #
      # @param org_name [String] Organization name
      # @param platform [String] Application platform (ios/android)
      # @param app_id [String] Application package name
      # @return [Deploygate::Client::Response]
      def app_teams(org_name:, platform:, app_id:)
        res = api.get "/api/organizations/#{org_name}/platforms/#{platform}/apps/#{app_id}/teams"
        Response.new(res)
      end

      # Add teams to the app,
      # @see https://docs.deploygate.com/reference#apps-teams-create
      #
      # @param org_name [String] Organization name
      # @param platform [String] Application platform (ios/android)
      # @param app_id [String] Application package name
      # @param team [String] Team name
      # @return [Deploygate::Client::Response]
      def add_app_team(org_name:, platform:, app_id:, team_name:)
        res = api.post "/api/organizations/#{org_name}/platforms/#{platform}/apps/#{app_id}/teams" do |request|
          request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
          request.body = URI.encode_www_form(
            {
              team: team_name
            }
          )
        end
        Response.new(res)
      end

      # Delete team from the app.
      # @see https://docs.deploygate.com/reference#apps-teams-destroy
      #
      # @param org_name [String] Organization name
      # @param platform [String] Application platform (ios/android)
      # @param app_id [String] Application package name
      # @param team [String] Team name
      # @return [Deploygate::Client::Response]
      def delete_app_team(org_name:, platform:, app_id:, team_name:)
        res = api.delete "/api/organizations/#{org_name}/platforms/#{platform}/apps/#{app_id}/teams/#{team_name}"
        Response.new(res)
      end

      # Delete distribution page.
      # @see https://docs.deploygate.com/reference#delete-distribution-page-by-name
      #
      # @param owner [String] User or organization name
      # @param platform [String] Application platform (ios/android)
      # @param app_id [String] Application package name
      # @param dist_name [String] Distribution page name
      # @return [Deploygate::Client::Response]
      def delete_app_distribution(owner:, platform:, app_id:, dist_name:)
        res = api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/distributions" do |request|
          request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
          request.body = URI.encode_www_form(
            {
              distribution_name: dist_name
            }
          )
        end
        Response.new(res)
      end
    end
  end
end
