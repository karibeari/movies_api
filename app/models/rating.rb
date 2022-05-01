# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie

  validates_uniqueness_of :movie_id, scope: [:user_id]

end
