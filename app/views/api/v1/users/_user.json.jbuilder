json.extract! user, :id, :username, :email, :name, :password, :created_at, :updated_at
json.url api_v1_user_url(user, format: :json)
