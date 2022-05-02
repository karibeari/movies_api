require 'rails_helper'

RSpec.describe Movie, type: :model do
  
  it 'validates presence of title' do
    expect(Movie.new).not_to be_valid
  end

  describe '.release_year scope' do
    let!(:jan_movie) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2021, 1, 1)) }
    let!(:dec_movie) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2021, 12, 31)) }
    let!(:may_movie) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2021, 5, 2)) }
    let!(:old_movie) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2018)) }
    let!(:new_movie) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2022)) }

    it 'includes all movies within the given year' do
      expect(Movie.release_year(2021)).to include(jan_movie, dec_movie, may_movie)
    end

    it 'excludes all movies outside the given year' do
      expect(Movie.release_year(2021)).not_to include(old_movie, new_movie)
    end

    it 'handles years with no movies' do
      expect(Movie.release_year(1987)).to be_empty
      expect{Movie.release_year(1987)}.not_to raise_error
    end
  end
  
end
