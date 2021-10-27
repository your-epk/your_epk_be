class Api::V1::PressesController < ApplicationController
  
  def index
    presses = Press.where(film_epk_id: params[:film_epk_id].to_i)
    render json: PressSerializer.new(presses)
  end 

  def create
    press = Press.new(press_params)
    if press.save
      render json: PressSerializer.new(press)
    else
      render json: { error: "An existing Film Epk id is required" }, status: :not_found
    end
  end

  # def update
  #   press = Press.find_by(id: @press_params[:id])
  #   press.update(@press_params)
  # end

  def destroy
    press = Press.find_by(id: params[:id])
    return render json: { error: "Press record does not exist" }, status: :not_found if press.nil?
    press.destroy
  end

  private

  def press_params
    params.
    require(:press).
    permit(:name_of_publication, :description, :link, :film_epk_id)
  end

end
