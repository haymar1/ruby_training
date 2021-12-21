class Tutorial4Controller < ApplicationController  
    def login_success
        name="rail"
        password="rail"
if(name==(params[:userinfo])[:name] && password==(params[:userinfo])[:password] ) 
    session[:name]="rail"
    session[:password]="rail"
    render 'login_success'
else 
    render 'index'
    end
end

def logout
    session[:name]=nil
    session[:password]=nil
    render 'index'
end
end