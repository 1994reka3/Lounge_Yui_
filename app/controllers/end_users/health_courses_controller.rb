class EndUsers::HealthCoursesController < ApplicationController

  def index
    if params[:location]
      @health_courses = HealthCourse.where(location: params[:location]).page(params[:page]).per(10)
    else
      @health_courses = HealthCourse.order(date: "DESC").page(params[:page]).per(10)
    end
  end

  def show
    @health_course = HealthCourse.find(params[:id])
  end

end
