class LoginController < ApplicationController
  def login
  end

  def successLogin
    user = UserServices.findByEmail(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to login_path
  end
end
