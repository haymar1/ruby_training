class UsersController < ApplicationController
  def index
    @users = UserServices.get_all_users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @is_user_create = UserServices.create_user(@user)
    # @current_user = User.find(1)
    @current_user = UserServices.get_user_by_id(session[:user_id])

    if @is_user_create
      UserMailer.with(user: @user, current_user: @current_user).newuser_mail.deliver_now
      redirect_to users_path, alert: "new user created, check your mail"
    else
      render :new
    end
  end

  def show
    @user = UserServices.get_user_by_id(params[:id])
  end

  def edit
    @user = UserServices.get_user_by_id(params[:id])
  end

  def update
    @user = UserServices.get_user_by_id(params[:id])
    @is_user_update = UserServices.update_user(@user, user_params)
    if @is_user_update
      redirect_to users_path, alert: "User information update successfully"
    else
      render :edit
    end
  end

  def destroy
    @user = UserServices.get_user_by_id(params[:id])
    UserServices.destroy_user(@user)
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
  end
end
