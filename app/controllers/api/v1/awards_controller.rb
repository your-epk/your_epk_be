class Api::V1::AwardsController < ApplicationController

  def check(award_params, film_epk)
    @award_params = award_params
    @film_epk = film_epk
    return create if award_params[:id].nil?
    return update if !award_params[:id].nil?
  end

  def create
    @film_epk.awards.create(@award_params)
    FilmEpkSerializer.new(@film_epk)
  end

  def update
    award = Award.find_by(id: award_params[:id])
  end
end
