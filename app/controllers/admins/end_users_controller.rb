class Admins::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @end_users = EndUser.all.order(id: "DESC")
  end

  def show
    @end_user = EndUser.find(params[:id])
    @posts = @end_user.posts
  end

end
