# frozen_string_literal: true

class ParseMoviesMetadata
  def initialize(csv_file, movies_to_parse = nil)
    @csv_file = csv_file
    @movies_to_parse = movies_to_parse
  end

  def perform
    CSV.foreach(@csv_file, headers: true).with_index do |row, i|
      ActiveRecord::Base.transaction do
        movie = create_movie(row)
        associate_genres(row, movie.id)
        associate_production_companies(row, movie.id)
      end

      next if @movies_to_parse.nil?
      return if i == @movies_to_parse - 1

    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.info "Skipped importing #{row['id']} - invalid record - #{e}"
    rescue StandardError => e
      Rails.logger.info "Skipped importing #{row['id']} - #{e}"
    end
  end

  private

  def create_movie(movie_row)
    movie = Movie.create!(
      id: movie_row['id'],
      title: movie_row['title'],
      budget: movie_row['budget'].presence,
      revenue: movie_row['revenue'].presence,
      release_date: format_date(movie_row['release_date']),
      popularity: movie_row['popularity'].presence
    )
  end

  def associate_genres(movie_row, movie_id)
    genres =  eval(movie_row['genres'])
    genres.each do |genre|
      g = Genre.find_or_create_by!(genre)
      MovieGenre.create!(
        genre_id: g.id,
        movie_id:
      )
    end
  rescue SyntaxError
    Rails.logger.info "Skipped importing #{row['id']} - bad data in genre field"
  end

  def associate_production_companies(movie_row, movie_id)
    companies = eval(movie_row['production_companies'])
    companies.each do |company|
      pc = ProductionCompany.find_or_create_by!(company)
      MovieProductionCompany.create!(
        production_company_id: pc.id,
        movie_id:
      )
    end
  rescue SyntaxError
    Rails.logger.info "Skipped importing #{row['id']} - bad data in production companies field"
  end

  # in case date data is invalid, return nil
  def format_date(date)
    Date.parse(date)
  rescue StandardError
    nil
  end
end
