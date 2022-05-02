# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) { Genre.create(name: 'cartoon') }
  let(:movie_a) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2021), popularity: 2.5) }
  let(:movie_b) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2021), popularity: 8.8) }
  let(:movie_c) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2021), popularity: 5.8) }
  let(:movie_d) { Movie.create(title: Faker::Lorem.word, release_date: Time.new(2018), popularity: 9.0) }

  before do
    [movie_a, movie_b, movie_c, movie_d].each do |movie|
      MovieGenre.create(movie_id: movie.id, genre_id: genre.id)
    end
  end

  it 'validates presence of name' do
    expect(Genre.new).not_to be_valid
  end

  describe '#movies_released_by_year' do
    before { genre.year = 2021 }

    it 'includes all movies within the given year' do
      expect(genre.movies_released_by_year).to include(movie_a, movie_b, movie_c)
    end

    it 'excludes all movies outside the given year' do
      expect(genre.movies_released_by_year).not_to include(movie_d)
    end

    it 'handles years with no movies' do
      genre.year = 1954
      expect(genre.movies_released_by_year).to eq([])
      expect { genre.movies_released_by_year }.not_to raise_error
    end
  end

  describe 'average_annual_popularity' do
    before { genre.year = 2021 }

    it 'averages popularity for all movies within the given year' do
      expect(genre.average_annual_popularity).to eq(5.7)
    end

    it 'handles years with no movies' do
      genre.year = 1954
      expect(genre.average_annual_popularity).to eq(nil)
      expect { genre.average_annual_popularity }.not_to raise_error
    end
  end
end
