class EndUsers::PostsController < ApplicationController
  before_action :authenticate_end_user!, except: [:index]
  before_action :ensure_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(id: "DESC")
    @parents = Department.where(ancestry: nil)
  end

  def show
    @end_user = @post.end_user
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    if @post.save
      flash[:success] = "投稿が完了しました"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    if current_end_user.id != @post.end_user_id
      redirect_to posts_path
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "投稿を変更しました"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :contents, :department_id, :genre_id)
  end

  def ensure_post
    @post = Post.find(params[:id])
  end

end
