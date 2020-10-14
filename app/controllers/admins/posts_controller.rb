class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_post, only: %i[show destroy]

  def index
    @departments = Department.all
    @genres = Genre.all
    case params[:uncheck]
    when 'posts'
      @posts = Post.where(mark: false).page(params[:page]).desc_list
    when 'post_comments'
      @post_comments = PostComment.where(mark: false)
      @posts = Post.where(id: @post_comments.pluck(:post_id).uniq).page(params[:page]).desc_list
    else
      @posts = Post.page(params[:page]).desc_list
    end
  end

  def show
    @departments = Department.all
    @genres = Genre.all
  end

  def destroy
    @post.destroy
    flash[:success] = '削除しました'
    redirect_to admins_posts_path
  end

  def check
    @post = Post.find(params[:post_id])
    @post.update(mark: true)
  end

  def uncheck
    @post = Post.find(params[:post_id])
    @post.update(mark: false)
  end

  private

  def ensure_post
    @post = Post.find(params[:id])
  end
end
