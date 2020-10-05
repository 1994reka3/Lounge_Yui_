class AddDateToHealthCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :health_courses, :date, :string
  end
end
