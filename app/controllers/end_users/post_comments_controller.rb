class EndUsers::PostCommentsController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_end_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    render 'posts/show' unless @comment.save
    # if @comment.save
    # else
    #   render 'posts/show'
    # end
  end

  def destroy
    @post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
