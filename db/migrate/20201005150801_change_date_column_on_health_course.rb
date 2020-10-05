class ChangeDateColumnOnHealthCourse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :health_courses, :date, false
  end
end
