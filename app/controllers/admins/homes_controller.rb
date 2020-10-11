class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = Post.where(mark: false)
    @post_comments = PostComment.where(mark: false)
  end
end
