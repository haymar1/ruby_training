class UserMailer < ApplicationMailer
  def newuser_mail
    @created_user = params[:user]
    @current_user = params[:current_user]
    mail to: @current_user.email
  end
end
