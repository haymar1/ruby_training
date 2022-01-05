class PostsController < ApplicationController
  def index
    @posts = PostServices.getAllPosts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @user = UserServices.getUserByID(params[:id])
    # @is_save_post = @user.PostServices.createPost(@post)
    if @post.save
      redirect_to user_path(id: @post.user_id)
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
      redirect_to user_path(id: @post.user_id)
    else
      render :edit
    end
  end

  def destroy
    @post = PostServices.getPostByID(params[:id])
    PostServices.destroyPost(@post)
    redirect_to user_path(id: @post.user_id)
  end

  def post_params
    params.require(:post).permit(:title, :description, :public_flag, :user_id)
  end
end
