class Tutorial4Controller < ApplicationController  
    def login_success
        @name=(params[:userinfo])[:name]
        password=((params[:userinfo])[:password])
        session[:@name]="Rail"
        session[:password]="rail"
    end
end