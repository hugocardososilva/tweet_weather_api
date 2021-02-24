json.extract! tweet, :id, :status, :message, :created_at, :updated_at
json.url api_v1_tweet_url(tweet, format: :json)
