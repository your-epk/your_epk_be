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

  private

  def film_epk_params
    params.require(:movie_detail).
      permit(:user_id, 
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

