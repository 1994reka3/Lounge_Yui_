class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_post, only: %i[show destroy]

  def index
    @departments = Department.all
    @genres = Genre.all
    case params[:uncheck]
    when 'posts'  # 投稿未チェックのとき
      @posts = Post.where(mark: false).page(params[:page]).desc_list
    when 'post_comments'  # コメント未チェックのとき
      @post_comments = PostComment.where(mark: false)
      @posts = Post.where(id: @post_comments.pluck(:post_id).uniq).page(params[:page]).desc_list
    end
    if params[:q]  # キーワード検索のとき
      @search = Post.ransack(params[:q])
      @posts = @search.result.page(params[:page]).desc_list
    elsif params[:name] # 診療科検索のとき
      @department = Department.find_by(id: params[:name])
      @posts = Post.department_search(params[:name]).page(params[:page]).desc_list
    elsif params[:genre_id] # ジャンル検索のとき
      @genre = Genre.find_by(id: params[:genre_id])
      @posts = Post.genre_search(params[:genre_id]).page(params[:page]).desc_list
    else  # 何も検索していないとき
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
