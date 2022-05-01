# frozen_string_literal: true

class ProductionCompany < ApplicationRecord

  has_many :movie_production_companies, dependent: :destroy
  has_many :movies, through: :movie_production_companies

  validates :name, presence: true, uniqueness: true

end
