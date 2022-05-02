# frozen_string_literal: true

class ProductionCompany < ApplicationRecord
  has_many :movie_production_companies, dependent: :destroy
  has_many :movies, through: :movie_production_companies

  validates :name, presence: true

  attr_accessor :year

  def budget
    @year ? annual_budget : all_time_budget
  end

  def revenue
    @year ? annual_revenue : all_time_revenue
  end

  def movies_produced
    @year ? movies_released_by_year : movies
  end

  def movies_released_by_year
    movies.release_year(@year)
  end

  def all_time_budget
    movies.map(&:budget).compact.sum
  end

  def all_time_revenue
    movies.map(&:revenue).compact.sum
  end

  def annual_budget
    movies_released_by_year.map(&:budget).compact.sum
  end

  def annual_revenue
    movies_released_by_year.map(&:revenue).compact.sum
  end

end
