# frozen_string_literal: true

class CreateMovieProductionCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_production_companies do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :production_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
