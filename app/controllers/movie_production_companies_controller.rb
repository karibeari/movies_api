# frozen_string_literal: true

class MovieProductionCompaniesController < ApplicationController
  before_action :set_movie_production_company, only: %i[show edit update destroy]

  # GET /movie_production_companies or /movie_production_companies.json
  def index
    @movie_production_companies = MovieProductionCompany.all
  end

  # GET /movie_production_companies/1 or /movie_production_companies/1.json
  def show; end

  # GET /movie_production_companies/new
  def new
    @movie_production_company = MovieProductionCompany.new
  end

  # GET /movie_production_companies/1/edit
  def edit; end

  # POST /movie_production_companies or /movie_production_companies.json
  def create
    @movie_production_company = MovieProductionCompany.new(movie_production_company_params)

    respond_to do |format|
      if @movie_production_company.save
        format.html do
          redirect_to movie_production_company_url(@movie_production_company),
                      notice: 'Movie production company was successfully created.'
        end
        format.json { render :show, status: :created, location: @movie_production_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_production_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_production_companies/1 or /movie_production_companies/1.json
  def update
    respond_to do |format|
      if @movie_production_company.update(movie_production_company_params)
        format.html do
          redirect_to movie_production_company_url(@movie_production_company),
                      notice: 'Movie production company was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @movie_production_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie_production_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_production_companies/1 or /movie_production_companies/1.json
  def destroy
    @movie_production_company.destroy

    respond_to do |format|
      format.html do
        redirect_to movie_production_companies_url, notice: 'Movie production company was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie_production_company
    @movie_production_company = MovieProductionCompany.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_production_company_params
    params.require(:movie_production_company).permit(:movie_id, :production_company_id)
  end
end
