Rails.application.routes.draw do
  get '/index' , to: 'tutorial6#index'
  post "/uploadimage", to: "tutorial6#upload_image"
end
