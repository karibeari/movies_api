# frozen_string_literal: true

class GenresController < ApplicationController

  def index
    @genres = SortGenresByPopularity.new(params[:year]).perform

    render json: @genres
  end

end
