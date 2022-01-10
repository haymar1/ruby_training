class PostService
  class << self
    def getAllPosts
      @posts = PostRepository.getAllPosts
    end
  end
end
