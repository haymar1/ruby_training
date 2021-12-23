Rails.application.routes.draw do
  get 'site/home'

  resources :posts
end
