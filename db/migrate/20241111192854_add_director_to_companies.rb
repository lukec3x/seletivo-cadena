class AddDirectorToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_reference :companies, :director, null: false, foreign_key: true
  end
end
