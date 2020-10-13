class EndUsers::HealthCoursesController < ApplicationController

  def index
    @health_courses = HealthCourse.after_today_asc.page(params[:page]).per(10)
    if params[:location]
      @health_courses = HealthCourse.where(location: params[:location]).after_today_asc.page(params[:page]).per(10)
    end
  end

  def show
    @health_course = HealthCourse.find(params[:id])
  end
end
