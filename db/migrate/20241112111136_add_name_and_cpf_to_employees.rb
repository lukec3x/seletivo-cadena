class AddNameAndCpfToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :name, :string
    add_column :employees, :cpf, :string
  end
end
