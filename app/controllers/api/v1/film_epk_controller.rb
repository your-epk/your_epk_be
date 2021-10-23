class Api::V1::FilmEpkController < ApplicationController

  def create
    user = User.find_by(id: film_epk_params[:user_id].to_i)

    epk = FilmEpk.new(film_epk_params)

    if epk.save
      render json: FilmEpkSerializer.new(epk, include: [:awards]), status: :ok
    else
      render json: {error: "Please Fill In required Fields"}, status: :not_found
    end
  end

  def update
    film_epk = FilmEpk.find_by(id: params[:id].to_i)
    unless film_epk_params[:award] || film_epk_params[:film_fam] || film_epk_params[:presses]
      film_epk.update(film_epk_params)
      render json: FilmEpkSerializer.new(film_epk, include: [:awards])
    end

    movie_poster = film_epk_params[:movie_poster]
    if !movie_poster.nil?
      film_epk.movie_poster.attach(movie_poster)
      render json: film_epk.as_json(root: false, methods: :movie_poster_url).except('updated_at')
    end
    # render json: AwardsController.new.check(film_epk_params[:award], film_epk) if film_epk_params[:award]
    render json: FilmFamsController.new.check(film_epk_params[:film_fam], film_epk) if film_epk_params[:film_fam]
    render json: PressesController.new.check(film_epk_params[:presses], film_epk) if film_epk_params[:presses]
  end

  def destroy
    film_epk = FilmEpk.find(params[:id].to_i)
    film_epk.destroy
  end

  def show
    film_epk = FilmEpk.find(params[:id].to_i)
    render json: FilmEpkSerializer.new(film_epk, include: [:awards])
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
             # award: [:name, :year, :award_type],
             film_fam: [:role, :first_name, :last_name, :description],
             presses: [:name_of_publication, :description, :link]
           )
  end
end
