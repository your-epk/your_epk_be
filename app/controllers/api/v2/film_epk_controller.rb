class Api::V2::FilmEpkController < ApplicationController

  def create
    return render json: { error: "Please log-in"}, status: :unauthorized if current_user.nil?
    epk = current_user.film_epks.new(film_epk_params)

    if epk.save
      render json: FilmEpkSerializer.new(epk, include: [:awards, :presses, :film_fams]), status: :ok
    else
      render json: {error: "Please Fill In required Fields"}, status: :not_found
    end
  end

  def update
    film_epk = FilmEpk.find_by(id: params[:id].to_i)
    film_epk.update(film_epk_params)
    render json: FilmEpkSerializer.new(film_epk, include: [:awards, :film_fams, :presses])
  end

  def destroy
    film_epk = FilmEpk.find(params[:id].to_i)
    film_epk.destroy
  end

  def show
    film_epk = FilmEpk.find(params[:id].to_i)
    render json: FilmEpkSerializer.new(film_epk, include: [:awards, :film_fams, :presses])
  end

  private

  def film_epk_params
    params.require(:film_epk).
      permit(:user_id,
             :id,
             :movie_title,
             :genre,
             :trailer,
             :teaser,
             :tag_line,
             :log_line,
             :synopsis,
             :genre,
             :country,
             :release_year,
             :run_time,
             :language,
             :budget,
             :website,
             :production_company,
             :distribution,
             :contact_name,
             :contact_email,
             :contact_number,
             :company_name,
             :header_image_description
      )
  end
end
