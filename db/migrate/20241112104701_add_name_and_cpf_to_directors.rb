class AddNameAndCpfToDirectors < ActiveRecord::Migration[7.1]
  def change
    add_column :directors, :name, :string
    add_column :directors, :cpf, :string
  end
end
