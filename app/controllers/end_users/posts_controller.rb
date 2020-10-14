class EndUsers::PostsController < ApplicationController
  before_action :authenticate_end_user!, except: [:index]
  before_action :ensure_post, only: %i[show edit update destroy]
  before_action :set_departments, only: %i[index show update]
  before_action :set_genres, only: %i[index show new create update]

  def index
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
    @end_user = @post.end_user
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
    @departments = Department.where(is_valid: true)
  end

  def create
    @departments = Department.where(is_valid: true)
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    if @post.save
      flash[:success] = '投稿が完了しました'
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    redirect_to posts_path if current_end_user.id != @post.end_user_id
  end

  def update
    if @post.update(post_params)
      flash[:success] = '投稿を変更しました'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '削除しました'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :contents, :department_id, :genre_id)
  end

  def ensure_post
    @post = Post.find(params[:id])
  end

  def set_departments
    @departments = Department.all
  end

  def set_genres
    @genres = Genre.all
  end
end
