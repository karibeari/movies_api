# frozen_string_literal: true

class ProductionCompaniesController < ApplicationController
  before_action :set_production_company, only: %i[show edit update destroy]

  # GET /production_companies or /production_companies.json
  def index
    @production_companies = ProductionCompany.all
  end

  # GET /production_companies/1 or /production_companies/1.json
  def show; end

  # GET /production_companies/new
  def new
    @production_company = ProductionCompany.new
  end

  # GET /production_companies/1/edit
  def edit; end

  # POST /production_companies or /production_companies.json
  def create
    @production_company = ProductionCompany.new(production_company_params)

    respond_to do |format|
      if @production_company.save
        format.html do
          redirect_to production_company_url(@production_company),
                      notice: 'Production company was successfully created.'
        end
        format.json { render :show, status: :created, location: @production_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @production_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_companies/1 or /production_companies/1.json
  def update
    respond_to do |format|
      if @production_company.update(production_company_params)
        format.html do
          redirect_to production_company_url(@production_company),
                      notice: 'Production company was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @production_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @production_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_companies/1 or /production_companies/1.json
  def destroy
    @production_company.destroy

    respond_to do |format|
      format.html { redirect_to production_companies_url, notice: 'Production company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_production_company
    @production_company = ProductionCompany.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def production_company_params
    params.require(:production_company).permit(:name)
  end
end
