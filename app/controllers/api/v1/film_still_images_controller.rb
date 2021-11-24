class Api::V1::FilmStillImagesController < ApplicationController
  def create
    film_image = fs_params[:blob_signed_id]
    film_still = FilmStill.find_by(id: fs_params[:film_still_id].to_i)
    if !film_still.nil?
      film_still.still_image.attach(film_image)
      render json: FilmStillSerializer.new(film_still)
    else
      render json: { error: "An existing Film Still id is required" }
    end
  end

  private
  def fs_params
    params.permit(:blob_signed_id, :film_still_id)
  end
end 