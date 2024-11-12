class AddCompanyNameAndCnpjToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :company_name, :string
    add_column :companies, :cnpj, :string
  end
end
