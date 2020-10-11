class Admins::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @end_users = EndUser.page(params[:page]).reverse_order
  end

  def show
    @end_user = EndUser.find(params[:id])
    @posts = @end_user.posts.page(params[:page]).reverse_order
  end

end
