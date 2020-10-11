class EndUsers::HealthCoursesController < ApplicationController
  def index
    @health_courses = if params[:location]
                        HealthCourse.where(location: params[:location]).page(params[:page]).per(10)
                      else
                        HealthCourse.order(date: 'DESC').page(params[:page]).per(10)
                      end
  end

  def show
    @health_course = HealthCourse.find(params[:id])
  end
end
