class EndUsers::HealthCoursesController < ApplicationController

  def index
    @health_courses = HealthCourse.order(date: 'ASC').page(params[:page]).per(10)
    if params[:location]
      @health_courses = HealthCourse.where(location: params[:location]).page(params[:page]).per(10)
    end
  end

  def show
    @health_course = HealthCourse.find(params[:id])
  end
end
