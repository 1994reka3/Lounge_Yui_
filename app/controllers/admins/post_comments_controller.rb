class Admins::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to admins_post_path(params[:post_id])
  end

  def check
  end

end
