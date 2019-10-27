module Deploygate
  class Client
    class API
      module Apps
        PLATFORM_ANDROID = 'android'
        PLATFORM_IOS = 'ios'
        ROLE_DEVELOPER = 1
        ROLE_TESTER = 2

        def post_app(owner:, file_path:, message: nil, distribution_key: nil, distribution_name: nil, release_note: nil, disable_notify: nil, visibility: nil)
          api.post "/api/users/#{owner}/apps" do |request|
            request.body = {
              file: Faraday::UploadIO.new(file_path, 'octet/stream')
            }
          end
        end

        def post_app_members(owner:, platform:, app_id:, users:, role: nil)
          api.post "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members" do |request|
            request.body = {
              users: users,
              role: role
            }
          end
        end

        def get_app_members(owner:, platform:, app_id:)
          api.get "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members"
        end

        def delete_app_members(owner:, platform:, app_id:, users:)
          api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/members" do |request|
            request.body = {
              users: users
            }
          end
        end

        def get_app_teams(org_name:, platform:, app_id:)
          api.get "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/teams"
        end

        def post_app_team(org_name:, platform:, app_id:, team:)
          api.post "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/teams" do |request|
            request.body = {
              team: team
            }
          end
        end

        def delete_app_team(org_name:, platform:, app_id:, team:)
          api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/teams/#{team}"
        end

        def delete_app_distribution(owner:, platform:, app_id:, dist_name:)
          api.delete "/api/users/#{owner}/platforms/#{platform}/apps/#{app_id}/distributions" do |request|
            request.body = {
              distribution_name: dist_name
            }
          end
        end
      end
    end
  end
end
