class EndUsers::PostsController < ApplicationController
  before_action :authenticate_end_user!, except: [:index]
  before_action :ensure_post, only: %i[show edit update destroy]
  before_action :set_search_post, only: [:index, :show]
  before_action :set_departments, only: %i[index show]
  before_action :set_genres, only: %i[index show new create edit update]

  def set_search_post
    @search = Post.ransack(params[:q])
  end

  def index
    @tags = Tag.all
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
    tag_list = params[:post][:name].split(",")
    if @post.save
      @post.save_tags(tag_list)
      flash[:success] = '投稿が完了しました'
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @departments = Department.where(is_valid: true)
    if current_end_user.id != @post.end_user_id
      redirect_to posts_path
    end
  end

  def update
    @departments = Department.where(is_valid: true)
    tag_list = params[:post][:name].split(",")
    if @post.update(post_params)
      @post.save_tags(tag_list)
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


