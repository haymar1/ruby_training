class PasswordResetsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "We have sent reset password links to your mail"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path, alert: "Your token have expired.Try Again"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to root_path, alert: "Your password was reset successfully.Please login Again"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password)
  end
end
