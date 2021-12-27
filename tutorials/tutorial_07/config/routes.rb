Rails.application.routes.draw do
  get "/index", to: "tutorial7#index"
  post "/save", to: "tutorial7#generate"
  post "/download", to: "tutorial7#download"
end
