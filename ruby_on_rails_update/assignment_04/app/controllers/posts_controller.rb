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
      redirect_to posts_path, alert: "post was successfully created"
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
      redirect_to posts_path, alert: "post was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @post = PostServices.get_post_by_id(params[:id])
    PostServices.destroy_post(@post)
    redirect_to posts_path, alert: "post was successfully destory"
  end

  def send_post
    current_user = User.find(session[:user_id])
    PostMailer.with(current_user: current_user).send_post.deliver_now
    redirect_to posts_path, alert: "we have sent post lists, please check your mails"
  end

  def post_params
    params.require(:post).permit(:title, :description, :public_flag, :user_id)
  end
end
