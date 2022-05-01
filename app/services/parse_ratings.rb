class ParseRatings

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def perform
    CSV.foreach(@csv_file, headers: true) do |row|
      ActiveRecord::Base.transaction do
        Rating.find_or_create_by!(
          user_id: row.dig('userId'),
          movie_id: row.dig('movieId'),
          stars: row.dig('rating')
        ) 
      end
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.info("Skipped importing rating for movie #{row.dig('movieId')} - #{e}")
      end
    end
  end