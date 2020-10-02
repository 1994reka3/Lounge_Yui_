class EndUsers::PostsController < ApplicationController

  def index; end

  def show; end

  def new
    @post = Post.new
    @departments = Department.all
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    @post.save
    redirect_to post_path(post)
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:title, :contents, :department_id, :genre_id)
  end

end
