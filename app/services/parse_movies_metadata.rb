class ParseMoviesMetadata

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def perform
    CSV.foreach(@csv_file, headers: true) do |row|
      ActiveRecord::Base.transaction do
        # assumption - one record per movie (no split data)
        movie = create_movie(row)
        associate_genres(row, movie.id)
        associate_production_companies(row, movie.id)  
      end

    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.info "Skipped importing #{row.dig('id')} - invalid record - #{e}" 
    rescue StandardError => e
      Rails.logger.info "Skipped importing #{row.dig('id')} - #{e}" 
    end
  end

  private

  def create_movie(movie_row)
    movie = Movie.create!(
      id: movie_row.dig('id'),
      title: movie_row.dig('title'),
      budget: movie_row.dig('budget').presence,
      revenue: movie_row.dig('revenue').presence,
      release_date: format_date(movie_row.dig('release_date')),
      popularity: movie_row.dig('popularity').presence
    )
  end

  def associate_genres(movie_row, movie_id)
    genres =  eval(movie_row.dig('genres')).map {|genre| genre[:name]}
    genres.each do |genre|
      g = Genre.find_or_create_by!(name: genre)
      MovieGenre.create!(
        genre_id: g.id,
        movie_id: movie_id
      )
    end
  rescue SyntaxError 
    Rails.logger.info "Skipped importing #{row.dig('id')} - bad data in genre field"
  end

  def associate_production_companies(movie_row, movie_id)
    companies =  eval(movie_row.dig('production_companies')).map {|company| company[:name]}
    companies.each do |company|
      pc = ProductionCompany.find_or_create_by!(name: company)
      MovieProductionCompany.create!(
        production_company_id: pc.id,
        movie_id: movie_id
      )
    end
  rescue SyntaxError 
    Rails.logger.info "Skipped importing #{row.dig('id')} - bad data in production companies field"
  end


  # in case date data is invalid, return nil
  def format_date(date)
    Date.parse(date)
  rescue 
    nil
  end

end