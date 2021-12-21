Rails.application.routes.draw do
  get '/index' , to: 'tutorial5#index'
  post "/uploadfile", to: "tutorial5#upload_file"
end
