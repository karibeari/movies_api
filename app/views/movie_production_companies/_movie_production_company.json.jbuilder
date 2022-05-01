# frozen_string_literal: true

json.extract! movie_production_company, :id, :movie_id, :production_company_id, :created_at, :updated_at
json.url movie_production_company_url(movie_production_company, format: :json)
