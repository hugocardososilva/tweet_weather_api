json.extract! tweet, :id, :status, :message, :user_id, :created_at, :updated_at
json.url api_v1_tweet_url(tweet, format: :json)
