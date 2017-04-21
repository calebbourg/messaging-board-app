class CommentsController < ApplicationController

	def create
	  @post = Post.find(params[:post_id])
      @comment = @post.comments.create!(comment_params.merge(user_id: current_user.id))
      # current_user.comments << @comment
      redirect_to post_path(@post)
	end

	def destroy 
	  @comment = Comment.find(params[:id])
	  @comment.destroy!
	  redirect_to post_path(params[:post_id])
	end


    private

	def comment_params
      params.require(:comment).permit(:body)
	end
end