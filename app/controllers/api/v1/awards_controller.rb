class Api::V1::AwardsController < ApplicationController

  def check(award_params, film_epk)
    @award_params = award_params
    @film_epk = film_epk
    return create if award_params[:id].nil?
    return update if !award_params[:id].nil?
  end

  def create
    award = @film_epk.awards.new(@award_params)
    if award.save
     return FilmEpkSerializer.new(@film_epk)
    end
    { error: "Problems" }
  end

  def update
    award = Award.find_by(id: award_params[:id])
  end
end
