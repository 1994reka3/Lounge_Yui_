class AddIsValidToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :is_valid, :boolean, default: true, null: false
  end
end
