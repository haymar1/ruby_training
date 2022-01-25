class PostServices
  class << self
    def get_all_posts
      @posts = PostRepository.get_all_posts
    end

    def create_post(post)
      PostRepository.create_post(post)
    end

    def get_post_by_id(id)
      @post = PostRepository.get_post_by_id(id)
    end

    def update_post(post, post_params)
      @is_post_update = PostRepository.update_post(post, post_params)
    end

    def destroy_post(post)
      PostRepository.destroy_post(post)
    end
  end
end
