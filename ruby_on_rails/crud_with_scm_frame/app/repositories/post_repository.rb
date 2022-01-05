class PostRepository
  class << self
    def getAllPosts
      @posts = Post.all
    end

    def createPost(post)
      post.save
    end

    def getPostByID(id)
      @post = Post.find(id)
    end

    def updatePost(post, post_params)
      @is_update_post = post.update(post_params)
    end

    def destroyPost(post)
      post.destroy
    end
  end
end
