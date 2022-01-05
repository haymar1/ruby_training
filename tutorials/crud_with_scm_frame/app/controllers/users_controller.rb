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
    if @is_user_create
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
    params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
  end
end
