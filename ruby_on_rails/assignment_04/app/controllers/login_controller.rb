class LoginController < ApplicationController
  def successLogin
    user = UserServices.findByEmail(params[:session][:email])
    print "User #{user}"
    if user && user.authenticate(params[:session][:password])
      redirect_to users_path, notice: "Login Successfully"
    else
      redirect_to login_path
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to login_path
  end
end
