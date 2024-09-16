Rails.application.routes.draw do
  root "password_resets#index"
  get "login", to: "password_resets#index"
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
end
