class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.integer :department_id, null: false, foreign_key: true
      t.integer :genre_id, null: false, foregin_key: true
      t.string :title, null: false
      t.text :contents, null: false
      t.boolean :mark, null: false, default: false
      t.timestamps
    end
  end
end
