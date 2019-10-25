module Deploygate
  class Client
    class API
      module Organizations
        def get_organizations
          api.get '/api/organizations'
        end

        def post_organization(org_name:, description: nil)
          api.post '/api/organizations' do |request|
            request.params[:name] = org_name
            request.params[:description] = description
          end
        end

        def get_organization(org_name:)
          api.get "/api/organizations/#{org_name}"
        end

        def patch_organization(org_name:, description: nil)
          api.patch "/api/organizations/#{org_name}" do |request|
            request.params[:description] = description
          end
        end

        def delete_organization(org_name:)
          api.delete "/api/organizations/#{org_name}"
        end

        def get_organization_members(org_name:, team_name: nil)
          api.get "/api/organizations/#{org_name}/members"
        end

        def post_organization_member(org_name:, user_name: nil, email: nil)
          api.post "/api/organizations/#{org_name}/members" do |request|
            request.params[:user_name] = user_name
            request.params[:email] = email
          end
        end

        def delete_organization_member(org_name:, user_id:)
          api.delete "/api/organizations/#{org_name}/members/#{user_id}" do |request|
            request.params[:id] = user_id
          end
        end

        def get_team_members(org_name:, team_name:)
          api.get "/api/organizations/#{org_name}/teams/#{team_name}/users"
        end

        def post_team_member(org_name:, team_name:, user_name:)
          api.post "/api/organizations/#{org_name}/teams/#{team_name}/users" do |request|
            request.params[:user] = user_name
          end
        end

        def delete_team_member(org_name:, team_name:, user_name:)
          api.delete "/api/organizations/#{org_name}/teams/#{team_name}/users/#{user_name}"
        end
      end
    end
  end
end
