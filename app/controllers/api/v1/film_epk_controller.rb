class Api::V1::FilmEpkController < ApplicationController

  def create
    user = User.find_by(id: film_epk_params[:user_id].to_i)

    epk = FilmEpk.new(film_epk_params)

    if epk.save
      render json: FilmEpkSerializer.new(epk), status: :ok
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

    render json: AwardsController.new.check(film_epk_params[:award], film_epk) if film_epk_params[:award]
    render json: FilmFamsController.new.check(film_epk_params[:film_fam], film_epk) if film_epk_params[:film_fam]

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
             :movie_poster,
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
             :header_image,
             award: [:name, :year, :award_type],
             film_fam: [:role, :first_name, :last_name, :description]
           )
  end
end
