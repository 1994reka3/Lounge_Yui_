class EndUsers::PostsController < ApplicationController

  def index; end

  def show; end

  def new
    @post = Post.new
    @departments = Department.all
    @genres = Genre.all
  end

  def edit; end

end
