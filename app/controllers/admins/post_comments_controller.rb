class Admins::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    flash[:success] = "削除しました"
    redirect_to admins_post_path(params[:post_id])
  end

  def check
    @post_comment = PostComment.find_by(post_id: params[:post_id], id: params[:post_comment_id])
    @post_comment.update(mark: true)
  end

  def uncheck
    @post_comment = PostComment.find_by(post_id: params[:post_id], id: params[:post_comment_id])
    @post_comment.update(mark: false)
  end

end
