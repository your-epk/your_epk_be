class Api::V1::HeadShotsController < ApplicationController
  def create
    head_shot = hs_params[:blob_signed_id]
    film_fam = FilmFam.find_by(id: hs_params[:film_fam_id].to_i)
    if !film_fam.nil?
      film_fam.head_shot.attach(head_shot)

      render json: FilmFamSerializer.new(film_fam)
    else
      render json: { error: "An existing Film Fam id is required" }
    end
  end

  private
  def hs_params
    params.permit(:blob_signed_id, :film_fam_id)
  end
end
