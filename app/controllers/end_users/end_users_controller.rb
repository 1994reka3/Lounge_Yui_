class EndUsers::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user = EndUser.find(params[:id])
    @posts = @end_user.posts
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

end
