# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProductionCompanies', type: :request do
  let!(:prod_comp) { ProductionCompany.create(name: 'Fly Films') }

  describe 'GET /index' do
    it 'returns HTTP success' do
      get '/production_companies'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show/:id' do
    it 'returns HTTP success' do
      get "/production_companies/#{prod_comp.id}"
      expect(response.status).to eq(200)
    end
  end

  # TODO: add more controller tests, test response body
end
