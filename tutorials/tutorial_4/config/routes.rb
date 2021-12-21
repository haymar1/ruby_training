Rails.application.routes.draw do
  get '/index' , to: 'tutorial4#index'
  post "/index/login", to: "tutorial4#login_success"
end
