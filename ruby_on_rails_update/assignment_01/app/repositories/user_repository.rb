class UserRepository
  class << self
    def find_by_email(email)
      @user = User.find_by(email: email)
    end

    def get_all_users
      @users = User.all
    end

    def create_user(user)
      @is_user_create = user.save
    end

    def get_user_by_id(id)
      @user = User.find(id)
    end

    def update_user(user, user_params)
      @is_update_user = user.update(user_params)
    end

    def destroy_user(user)
      user.destroy
    end
  end
end
