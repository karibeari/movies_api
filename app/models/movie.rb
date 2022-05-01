# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres

  has_many :movie_production_companies, dependent: :destroy
  has_many :production_companies, through: :movie_production_companies


  # attr_accessor :title, :budget, :revenue, :release_date

  validates :title, presence: true, uniqueness: true

end
