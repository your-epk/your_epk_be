class Api::V2::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def show
    return render json: { error: "Please log-in"}, status: :unauthorized if current_user.nil?
    render json: UserSerializer.new(current_user, include: [:film_epks])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
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
