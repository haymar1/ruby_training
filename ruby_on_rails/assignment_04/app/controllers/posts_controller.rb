class PostsController < ApplicationController
  def index
    @posts = PostServices.getAllPosts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path(id: @post.user_id)
    else
      render :new
    end
  end

  def show
    @post = PostServices.getPostByID(params[:id])
  end

  def edit
    @post = PostServices.getPostByID(params[:id])
  end

  def update
    @post = PostServices.getPostByID(params[:id])
    @is_post_update = PostServices.updatePost(@post, post_params)
    if @is_post_update
      redirect_to posts_path(id: @post.user_id)
    else
      render :edit
    end
  end

  def destroy
    @post = PostServices.getPostByID(params[:id])
    PostServices.destroyPost(@post)
    redirect_to posts_path(id: @post.user_id)
  end

  def send_post
    current_user = User.find(1)
    PostMailer.with(current_user: current_user).send_post.deliver_now
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end
