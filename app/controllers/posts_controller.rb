class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
  end

  def create
    @post = Post.create!(post_params.merge(user_id: current_user.id))
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end

end