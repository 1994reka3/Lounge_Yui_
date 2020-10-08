class EndUsers::HealthCoursesController < ApplicationController

  def index
    if params[:location]
      @health_courses = HealthCourse.where(location: params[:location])
    else
      @health_courses = HealthCourse.page(params[:page]).reverse_order
    end
  end

  def show
    @health_course = HealthCourse.find(params[:id])
  end

end
