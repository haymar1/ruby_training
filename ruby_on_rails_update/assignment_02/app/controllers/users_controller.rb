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
    if @is_user_create
      redirect_to login_path, alert: "Account created successfully"
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
      redirect_to user_path, alert: "User information update successfully"
    else
      render :edit
    end
  end

  def destroy
    @user = UserServices.get_user_by_id(params[:id])
    UserServices.destroy_user(@user)
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
