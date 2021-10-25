class Api::V1::FilmFamsController < ApplicationController

  def create
    ff = FilmFam.new(ff_params)
    if ff.save
      render json: FilmFamSerializer.new(ff)
    else
      render json: { error: "An existing Film Epk id is required" }, status: :not_found
    end
  end

  def destroy
    ff = FilmFam.find_by(id: params[:id])
    return render json: { error: "Film Fam does not exist" }, status: :not_found if ff.nil?
    ff.destroy
  end 

  def update  
    fam = FilmFam.find_by(id: params[:id])
    fam.update(ff_params)
    render json: FilmFamSerializer.new(fam)
  end 

  private

  def ff_params
    params.
    require(:film_fam).
    permit(:role, :first_name, :last_name, :description, :film_epk_id)
  end

end 