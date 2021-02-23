json.extract! _setting, :id, :openwather_key, :twitter_api_key, :lang, :metric, :created_at, :updated_at
json.url _setting_url(_setting, format: :json)
