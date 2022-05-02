# frozen_string_literal: true

class ProductionCompaniesController < ApplicationController
  before_action :set_production_company, only: %i[show]

  def index
    @production_companies = ProductionCompany.all

    render json: @production_companies
  end

  def show
    @production_company.year = params[:year]

    render json: @production_company.serializable_hash(
      methods: %i[budget revenue movies_produced]
    )
  end

  private

  def set_production_company
    @production_company = ProductionCompany.find(params[:id])
  end
end
