class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :end_user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :genre, null: false, foregin_key: true
      t.string :title, null: false
      t.text :contents, null: false
      t.boolean :mark, null: false, default: false
      t.timestamps
    end
  end
end
