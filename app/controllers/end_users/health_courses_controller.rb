class EndUsers::HealthCoursesController < ApplicationController

  def index
    @health_courses = HealthCourse.all.order(id: "DESC")
  end

  def show
    @health_course = HealthCourse.find(params[:id])
  end

end
