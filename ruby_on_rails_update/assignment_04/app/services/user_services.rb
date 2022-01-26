class UserServices
  class << self
    def find_by_email(email)
      @user = UserRepository.find_by_email(email)
    end

    def get_all_users
      @users = UserRepository.get_all_users
    end

    def create_user(user)
      @is_user_create = UserRepository.create_user(user)
    end

    def get_user_by_id(id)
      @user = UserRepository.get_user_by_id(id)
    end

    def update_user(user, user_params)
      @is_user_update = UserRepository.update_user(user, user_params)
    end

    def destroy_user(user)
      UserRepository.destroy_user(user)
    end
  end
end
