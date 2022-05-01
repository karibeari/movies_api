# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres

  has_many :movie_production_companies, dependent: :destroy
  has_many :production_companies, through: :movie_production_companies

  validates :title, presence: true, uniqueness: true

  scope :release_year, ->(year) { 
    where('release_date >= ? AND release_date <= ?', Time.new(year).beginning_of_year, Time.new(year).end_of_year)
  }
end
