json.extract! tweet, :id, :status, :message, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
