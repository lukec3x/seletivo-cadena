class CompaniesController < ApplicationController
  def new
    @company = current_director&.companies&.build
  end

  def create
    @company = current_director.companies.build(company_params)
    if @company.save
      redirect_to root_path, notice: "Company criada com sucesso."
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :cnpj)
  end
end
