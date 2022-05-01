# frozen_string_literal: true

class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    render json: @movies
  end

end
