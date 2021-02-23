json.extract! api_v1_setting, :id, :openwather_key, :twitter_api_key, :lang, :metric, :created_at, :updated_at
json.url api_v1_setting_url(api_v1_setting, format: :json)
