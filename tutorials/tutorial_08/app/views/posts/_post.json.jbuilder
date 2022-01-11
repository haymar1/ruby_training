json.extract! post, :id, :title, :description, :public_flag, :created_at, :updated_at, :user_name
json.url post_url(post, format: :json)
