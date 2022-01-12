class PostMailer < ApplicationMailer
  def send_post
    @current_user = params[:current_user]
    @posts = @current_user.posts
    mail to: @current_user.email
  end
end
