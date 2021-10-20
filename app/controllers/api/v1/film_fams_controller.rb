class Api::V1::FilmFamsController < ApplicationController
  def check(film_fam_params, film_epk)
    @ff_params = film_fam_params
    @film_epk = film_epk
    return create if @ff_params[:id].nil?
    return update if !@ff_params[:id].nil?
  end

  def create
    @film_epk.film_fams.create(@ff_params)
    FilmEpkSerializer.new(@film_epk)
  end 

  def update  
    fam = FilmFam.find_by(id: film_fam_params[:id])
    fam.update(@ff_params)
  end 
end 