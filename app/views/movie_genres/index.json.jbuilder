# frozen_string_literal: true

json.array! @movie_genres, partial: 'movie_genres/movie_genre', as: :movie_genre
