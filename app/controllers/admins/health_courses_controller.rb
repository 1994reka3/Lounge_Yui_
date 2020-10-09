class Admins::HealthCoursesController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_health_course, only: [:show, :edit, :update, :destroy]

  def index
    @health_courses = HealthCourse.order(date: "DESC").page(params[:page]).per(10)
  end

  def show
  end

  def new
   @health_course = HealthCourse.new
  end

  def create
    @health_course = HealthCourse.new(health_course_params)
    if @health_course.save
      flash[:success] = "登録が完了しました"
      redirect_to admins_health_courses_path(@health_course)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @health_course.update(health_course_params)
      flash[:success] = "内容を変更しました"
      redirect_to admins_health_course_path(@health_course)
    else
      render :edit
    end
  end

  def destroy
    @health_course.destroy
    flash[:success] = "削除しました"
    redirect_to admins_health_courses_path
  end

  private

  def health_course_params
    params.require(:health_course).permit(:title, :contents, :location, :date, :site)
  end

  def ensure_health_course
    @health_course = HealthCourse.find(params[:id])
  end
end
