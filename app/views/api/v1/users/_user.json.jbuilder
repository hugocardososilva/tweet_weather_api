# frozen_string_literal: true

json.extract! user, :id, :username, :email, :name, :password, :created_at, :updated_at
json.setting user.setting, partial: 'api/v1/settings/setting', as: :setting
json.url api_v1_user_url(user, format: :json)
