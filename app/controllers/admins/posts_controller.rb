class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_post, only: [:show, :destroy, :check]

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def show
  end

  def destroy
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to admins_posts_path
  end

  def check
    @post.update(mark: true)
  end

  private

  def ensure_post
    @post = Post.find(params[:id])
  end

end
