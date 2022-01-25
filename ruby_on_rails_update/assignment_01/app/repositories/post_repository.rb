class PostRepository
  class << self
    def get_all_posts
      @posts = Post.all
    end

    def create_post(post)
      post.save
    end

    def get_post_by_id(id)
      @post = Post.find(id)
    end

    def update_post(post, post_params)
      @is_update_post = post.update(post_params)
    end

    def destroy_post(post)
      post.destroy
    end
  end
end
