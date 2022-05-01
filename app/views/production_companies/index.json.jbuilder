# frozen_string_literal: true

json.array! @production_companies, partial: 'production_companies/production_company', as: :production_company
