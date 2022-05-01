require 'rails_helper'

RSpec.describe "Genres", type: :request do
  describe "GET /genres/:year" do
    it "returns HTTP success" do
      get "/genres/1995"
      expect(response.status).to eq(200)
    end
  end

  # TODO: add more controller tests, test response body
end
