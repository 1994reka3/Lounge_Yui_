class RemoveDateFromHealthCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :health_courses, :date, :date
  end
end
