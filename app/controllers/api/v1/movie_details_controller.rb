class Api::V1::MovieDetailsController < ApplicationController

  def create
    user = User.find_by(id: film_epk_params[:user_id].to_i)

    epk = FilmEpk.new(film_epk_params)

    if epk.save
      render json: MovieDetailsSerializer.new(epk), status: :ok
    else
      render json: {error: "Please Fill In required Fields"}, status: :not_found
    end
  end

  def update
   movie_poster = film_epk_params[:movie_poster]
   film_epk = FilmEpk.find_by(id: params[:id].to_i)
    if !movie_poster.nil?
      film_epk.movie_poster.attach(movie_poster)
      render json: film_epk.as_json(root: false, methods: :movie_poster_url).except('updated_at')
    end
    # Before action - evalute if award is existing or new - call #create or #update
    # AwardsController if award?
  end

  private

  def film_epk_params
    params.require(:movie_detail).
      permit(:user_id,
             :id,
             :movie_title,
             :movie_poster,
             :genre,
             :country,
             :release_year,
             :run_time,
             :language,
             :budget,
             :website,
             :production_company,
             :distribution)
  end
end
