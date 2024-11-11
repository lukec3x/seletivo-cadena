class AddDirectorToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :director, null: false, foreign_key: true
  end
end
