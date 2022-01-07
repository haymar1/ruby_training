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

  def search
    name = params[:name]
    email = params[:email]
    super_user_flag = params[:super_user_flag]
    phone = params[:phone]
    address = params[:address]
    birthday = params[:birthday]
    @users = User.where("name LIKE ? AND email LIKE ? AND super_user_flag LIKE ? AND phone LIKE ? AND address LIKE ? AND birthday LIKE ?", "%#{name}%", "%#{email}%", "%#{super_user_flag}%", "%#{phone}%", "%#{address}%", "%#{birthday}%")
    render :index
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
  end
end
