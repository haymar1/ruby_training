Rails.application.routes.draw do
  get '/index' , to: 'tutorial4#index'
  post "/login", to: "tutorial4#login_success"
  post "/logout", to: "tutorial4#logout"
end
