class Api::V1::MoviePostersController < ApplicationController
  def create
    movie_poster = poster_params[:blob_signed_id]
    film_epk = FilmEpk.find_by(id: poster_params[:film_epk_id].to_i)
    if !film_epk.nil?
      film_epk.movie_poster.attach(movie_poster)
      # render json: film_epk.as_json(root: false, methods: :movie_poster_url).except('updated_at')
      render json: { movie_poster_url: film_epk.movie_poster_url.as_json }
    else
      render json: { error: "An existing Film Epk id is required" }
    end
  end

  private
  def poster_params
    params.permit(:blob_signed_id, :film_epk_id)
  end
end
