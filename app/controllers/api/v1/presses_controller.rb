class Api::V1::PressesController < ApplicationController

  def check(press_params, film_epk)
    @press_params = press_params
    @film_epk = film_epk
    return create if @press_params[:id].nil?
    return update if !@press_params[:id].nil?
  end

  def create 
    @film_epk.presses.create(@press_params)
    FilmEpkSerializer.new(@film_epk)
  end

  # def update 
  #   press = Press.find_by(id: @press_params[:id])
  #   press.update(@press_params)
  # end 

end