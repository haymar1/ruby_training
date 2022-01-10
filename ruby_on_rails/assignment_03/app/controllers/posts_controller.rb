class PostsController < ApplicationController

  # GET /posts or /posts.json
  def index
    @posts = PostService.getAllPosts
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      @post.save
      format.html { redirect_to posts_path(@posts), notice: "Post was successfully created." }
      format.json { head :no_content }
      format.js { render :layout => false }
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js { render :layout => false }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.permit(:title, :description, :privacy)
  end
end
