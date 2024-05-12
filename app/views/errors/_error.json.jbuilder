json.extract! error, :id, :error, :content, :user_id, :created_at, :updated_at
json.url error_url(error, format: :json)
