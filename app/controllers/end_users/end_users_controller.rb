class EndUsers::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_end_user

  def show
    @posts = @end_user.posts
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      flash[:success] = "内容を変更しました"
      redirect_to end_user_path(@end_user)
    else
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :birthday, :postal_code, :email, :image)
  end

  def ensure_end_user
    @end_user = EndUser.find(params[:id])
  end
end
