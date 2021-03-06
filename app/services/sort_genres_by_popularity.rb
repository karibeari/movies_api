# frozen_string_literal: true

class SortGenresByPopularity
  def initialize(year)
    @year = year
    @popularity = {}
  end

  def perform
    Genre.all.map do |g|
      g.year = @year
      average_popularity = g.average_annual_popularity
      @popularity[g] = average_popularity
    end

    @popularity.sort_by { |_k, v| -v }
  end
end
