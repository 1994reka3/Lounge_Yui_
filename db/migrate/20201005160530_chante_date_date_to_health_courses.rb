class ChanteDateDateToHealthCourses < ActiveRecord::Migration[5.2]
  def change
    change_column :health_courses, :date, :date
  end
end
