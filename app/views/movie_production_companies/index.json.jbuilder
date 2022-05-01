# frozen_string_literal: true

json.array! @movie_production_companies, partial: 'movie_production_companies/movie_production_company',
                                         as: :movie_production_company
