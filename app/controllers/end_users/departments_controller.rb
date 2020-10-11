class EndUsers::DepartmentsController < ApplicationController
  def show
    @department = Department.find(params[:id])
    @posts = @department.set_posts
  end
end
