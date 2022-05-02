# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :movie_genres, dependent: :destroy
  has_many :movies, through: :movie_genres

  validates :name, presence: true

  attr_accessor :year

  def movies_released_by_year
    movies.release_year(@year)
  end

  # TODO: any way to reduce queries?
  def average_annual_popularity
    return nil if movies_released_by_year.empty?

    pop = movies_released_by_year.map(&:popularity).compact
    pop.sum / pop.size
  end
end
