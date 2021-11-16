class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def show
    user = User.find_by(id: user_params[:id])
    render json: UserSerializer.new(user, include: [:film_epks])
  end

  def create  
    user = User.new(user_params)
    if user.save 
      render json: { success: "User successfully created"}
    else 
      render json: { error: "Please fill in all required fields"}, status: :not_found
    end 
  end 

  private
  def user_params
    params.permit(:id,
                  :email,
                  :first_name,
                  :last_name,
                  :password,
                  :password_confirmation
                )
  end
end
