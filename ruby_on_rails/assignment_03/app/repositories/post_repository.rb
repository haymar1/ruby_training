class PostRepository
  class << self
    def getAllPosts
      @posts = Post.all
    end
  end
end
