Rails.application.routes.draw do
  get '/index' , to: 'tutorial6#index'
  post "/upload", to: "tutorial6#create"
end
