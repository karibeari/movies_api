# frozen_string_literal: true

json.extract! production_company, :id, :name, :created_at, :updated_at
json.url production_company_url(production_company, format: :json)
