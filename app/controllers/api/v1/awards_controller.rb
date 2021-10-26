class Api::V1::AwardsController < ApplicationController

  def create
    award = Award.new(award_params)
    if award.save
      render json: AwardSerializer.new(award)
    else
      render json: { error: "An existing Film Epk id is required" }, status: :not_found
    end
  end

  def update
    award = Award.find_by(id: params[:id])
    award.update(award_params)
    render json: AwardSerializer.new(award)
  end

  def destroy
    award = Award.find_by(id: params[:id])
    return render json: { error: "Award does not exist" }, status: :not_found if award.nil?
    award.destroy
  end

  private

  def award_params
    params.
    require(:award).
    permit(:name, :year, :award_type, :film_epk_id)
  end
end
