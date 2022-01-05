class PostServices
  class << self
    def getAllPosts
      @posts = PostRepository.getAllPosts
    end

    def createPost(post)
      PostRepository.createPost(post)
    end

    def getPostByID(id)
      @post = PostRepository.getPostByID(id)
    end

    def updatePost(post, post_params)
      @is_post_update = PostRepository.updatePost(post, post_params)
    end

    def destroyPost(post)
      PostRepository.destroyPost(post)
    end
  end
end
