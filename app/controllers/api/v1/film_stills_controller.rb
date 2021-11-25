class Api::V1::FilmStillsController < ApplicationController

  def create
    still = FilmStill.new(movie_still_params)
    if still.save
      render json: FilmStillSerializer.new(still)
    else
      render json: { error: "An existing Film Epk id is required" }, status: :not_found
    end
  end

  private
  def movie_still_params
    params.
    require(:film_still).
    permit(:description,
           :film_epk_id)
  end
end
