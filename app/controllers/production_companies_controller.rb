# frozen_string_literal: true

class ProductionCompaniesController < ApplicationController
  before_action :set_production_company, only: %i[show edit update destroy]

  # GET /production_companies or /production_companies.json
  def index
    @production_companies = ProductionCompany.all

    render json: @production_companies
  end

  # GET /production_companies/1 or /production_companies/1.json
  def show
    @production_company.year = params[:year]

    render json: @production_company.serializable_hash(
      methods: [:budget, :revenue, :movies_produced]
    )
  end
  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_production_company
    @production_company = ProductionCompany.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def production_company_params
    params.require(:production_company).permit(:name, :year)
  end
end
