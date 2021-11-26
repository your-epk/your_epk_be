class Api::V1::FilmStillsController < ApplicationController

  def index
    still = FilmStill.where(film_epk_id: params[:film_epk_id].to_i)
    render json: FilmStillSerializer.new(still)
  end

  def create
    still = FilmStill.new(movie_still_params)
    if still.save
      render json: FilmStillSerializer.new(still)
    else
      render json: { error: "An existing Film Epk id is required" }, status: :not_found
    end
  end

  def destroy
    still = FilmStill.find_by(id: params[:id])
    return render json: { error: "Film Still does not exist" }, status: :not_found if still.nil?
    still.destroy
  end

  private
  def movie_still_params
    params.
    require(:film_still).
    permit(:description,
           :film_epk_id)
  end
end
