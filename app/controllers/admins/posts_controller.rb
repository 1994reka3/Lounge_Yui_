class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to admins_posts_path
  end

  def check
  end

end
