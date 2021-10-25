class Api::V1::HeaderImagesController < ApplicationController
  def create
    header_image = image_params[:blob_signed_id]
    film_epk = FilmEpk.find_by(id: image_params[:film_epk_id].to_i)
    if !film_epk.nil?
      film_epk.header_image.attach(header_image)
      # render json: film_epk.as_json(root: false, methods: :header_image_url).except('updated_at')
      render json: { header_image_url: film_epk.header_image_url.as_json }
    else
      render json: { error: "An existing Film Epk id is required" }
    end
  end

  private
  def image_params
    params.permit(:blob_signed_id, :film_epk_id)
  end
end 