class EndUsers::PostsController < ApplicationController
  before_action :ensure_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @end_user = @post.end_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:title, :contents, :department_id, :genre_id)
  end

  def ensure_post
    @post = Post.find(params[:id])
  end

end
