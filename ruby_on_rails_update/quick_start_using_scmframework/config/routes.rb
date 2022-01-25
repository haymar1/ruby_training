Rails.application.routes.draw do
  root "login#login"
  get "/login", to: "login#login"
  post "/login", to: "login#successLogin"
  get "/logout", to: "login#logout"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  resources :users
  resources :posts
end
