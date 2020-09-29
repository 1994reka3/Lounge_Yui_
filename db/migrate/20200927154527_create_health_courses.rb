class CreateHealthCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :health_courses do |t|
      t.string :title, null: false
      t.text :contents, null: false
      t.integer :location, null: false, default: 0
      t.date :date, null: false
      t.string :site, null: false
      t.timestamps
    end
  end
end
