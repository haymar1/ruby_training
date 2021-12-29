json.extract! user, :id, :name, :password, :super_user_flag, :phone, :address, :birthday
json.url user_url(user, format: :json)
