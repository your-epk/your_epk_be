class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email].downcase)

    if user.authenticate(session_params[:password])
      render json: UserSerializer.new(user), status: :ok
    else
      render json: {error: "The information does not match any records"}, status: :not_found
    end
  end

  private

  def session_params
    params.require(:session).
      permit(:email, :password)
  end
end
