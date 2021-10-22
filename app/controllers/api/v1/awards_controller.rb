class Api::V1::AwardsController < ApplicationController

  def check(award_params, film_epk)
    @award_params = award_params
    @film_epk = film_epk
    return create if award_params[:id].nil?
    return update if !award_params[:id].nil?
  end

  def create
    award = Award.new(award_params)
    if award.save
      render json: AwardSerializer.new(award)
    else
      render json: { error: "An existing Film Epk id is required" }
    end
  end

  def update
    award = Award.find_by(id: award_params[:id])
  end

  private

  def award_params
    params.
    require(:award).
    permit(:name, :year, :award_type, :film_epk_id)
  end
end
