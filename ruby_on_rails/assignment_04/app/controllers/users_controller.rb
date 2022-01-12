class UsersController < ApplicationController
  def index
    @users = UserServices.getAllUsers
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @is_user_create = UserServices.createUser(@user)
    # @current_user = User.find(1)
    @current_user = UserServices.getUserByID(session[:user_id])

    if @is_user_create
      UserMailer.with(user: @user, current_user: @current_user).newuser_mail.deliver_now
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = UserServices.getUserByID(params[:id])
  end

  def edit
    @user = UserServices.getUserByID(params[:id])
  end

  def update
    @user = UserServices.getUserByID(params[:id])
    @is_user_update = UserServices.updateUser(@user, user_params)
    if @is_user_update
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = UserServices.getUserByID(params[:id])
    UserServices.destroyUser(@user)
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :address)
  end
end
