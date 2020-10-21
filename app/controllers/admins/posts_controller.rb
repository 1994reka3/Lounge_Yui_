class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_post, only: %i[show destroy]
  before_action :set_search_post, only: [:index, :show]
  before_action :set_departments, only: %i[index show]
  before_action :set_genres, only: %i[index show]

  def set_search_post
    @search = Post.ransack(params[:q])
  end

  def index
    @tags = Tag.all
    case params[:uncheck]
    when 'posts'  # 投稿未チェックのとき
      @posts = Post.where(mark: false).page(params[:page]).desc_list
    when 'post_comments'  # コメント未チェックのとき
      @post_comments = PostComment.where(mark: false)
      @posts = Post.where(id: @post_comments.pluck(:post_id).uniq).page(params[:page]).desc_list
    end
    if params[:q]  # キーワード、診療科、ジャンル検索のとき
      @posts = @search.result.page(params[:page]).desc_list
    elsif params[:tag_id] #タグ検索のとき
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.page(params[:page]).desc_list
    else  # 何も検索していないとき
      @posts = Post.page(params[:page]).desc_list
    end
  end

  def show
    @tags = Tag.all
    @post_tags = @post.tags
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

  def set_departments
    @departments = Department.all
    if params[:q] && params[:q][:department_id_eq]
      @department = Department.find_by(id: params[:q][:department_id_eq])
    end
  end

  def set_genres
    @genres = Genre.all
    if params[:q] && params[:q][:genre_id_eq]
      @genre = Genre.find_by(id: params[:q][:genre_id_eq])
    end
  end

end
