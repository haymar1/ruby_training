Rails.application.routes.draw do      
 get '/date' , to: 'tutorial3#index'
 post "/date/display", to: "tutorial3#calculate_age"
end  