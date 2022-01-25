class PostsController < ApplicationController
  def index
    @posts = PostServices.get_all_posts
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])

    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to user_path(id: @post.user_id), alert: "post was successfully created"
    else
      render :new
    end
  end

  def show
    @post = PostServices.get_post_by_id(params[:id])
  end

  def edit
    @post = PostServices.get_post_by_id(params[:id])
  end

  def update
    @post = PostServices.get_post_by_id(params[:id])
    @is_post_update = PostServices.update_post(@post, post_params)
    if @is_post_update
      redirect_to user_path(id: @post.user_id), alert: "post was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @post = PostServices.get_post_by_id(params[:id])
    PostServices.destroy_post(@post)
    redirect_to user_path(id: @post.user_id)
  end

  def download_csv
    @posts = PostServices.getAllPosts
    respond_to do |format|
      format.html
      format.csv { send_data @posts.to_csv, filename: "posts.csv" }
    end
  end

  def import
    Post.import(params[:file])
    redirect_to posts_path, notice: "Products imported."
  end

  def post_params
    params.require(:post).permit(:title, :description, :public_flag, :user_id)
  end
end
