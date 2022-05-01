# frozen_string_literal: true

class MovieProductionCompany < ApplicationRecord
  belongs_to :movie
  belongs_to :production_company
end
