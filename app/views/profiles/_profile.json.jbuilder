json.extract! profile, :id, :username, :number, :user_id, :picture, :wallet, :created_at, :updated_at
json.url profile_url(profile, format: :json)
